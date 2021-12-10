# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'iconv/version'

Gem::Specification.new do |gem|
  gem.name          = "iconv"
  gem.version       = Iconv::VERSION
  gem.authors       = ["NARUSE, Yui"]
  gem.email         = ["naruse@airemix.jp"]
  gem.description   = %q{iconv wrapper library}
  gem.summary       = %q{iconv wrapper library}
  gem.homepage      = "https://github.com/ruby/iconv"

  gem.files         = `git ls-files`.split($/)
  if RUBY_ENGINE == 'jruby'
    gem.files << 'lib/iconv/iconv_jruby.jar'
  else
    gem.extensions    = ['ext/iconv/extconf.rb']
  end
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.required_ruby_version = '>= 1.8.7'
  gem.require_paths = ["lib"]
end
