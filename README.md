at\_least\_one\_existence\_validator
====================================

Easy to use Rails active model validator which tests whether an associated. collection will have any objects after saving. It's useful with one-to-many and many-to-many relationships.

Installing
----------

1. Add to the `Gemfile`:
```ruby
gem 'at_least_one_validator'
```
2. After adding, install it
```shell
bundle install
```

Usage
-----

Given you have 'Author' model and 'Book' model respectively. Obviously author can write many books and book can be written by many authors but a book must have at least one author, so eventually you have something like this:

```ruby
class Author < ActiveRecord::Base
  has_and_belongs_to_many :books
end

class Book   < ActiveRecord::Base
  has_and_belongs_to_many :authors
end
```

If you want to use *at_least_one_existence_validator*, you just need to add helper method ```ruby validates_at_least_one_existence_of```to the model class and list all the collections you want to be validated as parameters. Let's do it:

```ruby
class Author < ActiveRecord::Base
  has_and_belongs_to_many :books
end

class Book   < ActiveRecord::Base
  has_and_belongs_to_many :authors

  validates_at_least_one_existence_of :authors
end
```

This code will test whether the authors of the tested book are marked for destruction or authors are already blank. If they are, validator will add default error message.

Configuring
-----------

The default error message for English locale is "must have at least one item.". You can specify your own error message adding it with ```ruby at_least_one:``` key to localization backend. Using previous example and standard i18n localization mechanism for static content we do the next:

```ruby
# file project_root/config/locales/en.yml
en:
  activerecord:
    errors:
      models:
        book:
          attributes:
            authors:
              at_least_one: 'must have at least one author.'
```

Message for *at_least_one_existence_validator* scoped by book and its authors is changed now.

License
-------

The MIT License (MIT)

Copyright (c) 2013 Valeriy Utyaganov

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
