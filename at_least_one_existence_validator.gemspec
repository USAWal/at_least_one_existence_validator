$:.push File.expand_path("../lib", __FILE__)
require 'at_least_one_existence_validator/version'

Gem::Specification.new do |s|
  s.platform              = Gem::Platform::RUBY
  s.files                 = Dir['lib/**/*.rb', 'locales/*.yml']
  s.name                  = 'at_least_one_existence_validator'
  s.require_paths         = ['lib', 'locales']
  s.summary               = 'Validator for associated collection'
  s.version               = AtLeastOneExistenceValidator::VERSION
  s.author                = 'Valeriy Utyaganov'
  s.description           = <<-EOF
    This validator tests whether associated collection is going to be empty
    after saving. It will be passed if at least one association
    of the specified collection will exist. The validator provides
    helper method and default error message.
  EOF
  s.email                 = 'usawal@gmail.com'
  s.homepage              = 'http://rubygems.org/at_least_one_existence_validator'
  s.license               = 'MIT'
  s.post_install_message  = <<-EOF
    Thank you for installing!'
    validates_at_least_one_existence_of - helper method
    :at_least_one                       - key for error message in i18n 
  EOF
  s.required_ruby_version = '>= 1.9.2'

  s.add_runtime_dependency     'activemodel', '>= 3'
  s.add_development_dependency 'activesupport'
end
