source 'https://rubygems.org'

# Specify your gem's dependencies in iconv.gemspec
gemspec

if RUBY_VERSION < '1.9.3'
  gem 'rake', '~> 10.0'
else
  gem 'rake'
end

group :development, :test do
  if RUBY_VERSION < '1.9'
    gem 'test-unit', '~> 2.5'
  else
    gem 'test-unit'
  end
end
