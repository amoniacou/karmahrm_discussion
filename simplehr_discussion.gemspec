$LOAD_PATH.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'simplehr_discussion/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'simplehr_discussion'
  s.version     = SimplehrDiscussion::VERSION
  s.authors     = ['Aboobacker MK']
  s.email       = ['aboobackervyd@gmail.com']
  s.homepage    = ''
  s.summary     = 'Summary of SimplehrDiscussion.'
  s.description = 'Description of SimplehrDiscussion.'
  s.license     = 'LGPL'

  s.files = Dir['{app,config,db,lib}/**/*', 'Rakefile', 'README.rdoc']
  s.test_files = Dir['test/**/*']

  s.add_dependency 'rails', '~> 4.2.0'
  s.add_dependency 'rails-observers'
  s.add_dependency 'workflow'

  s.add_development_dependency 'sqlite3'
end
