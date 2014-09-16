require "bundler/gem_tasks"
require 'rake/testtask'
require 'rake/clean'

NAME = 'iconv'

# rule to build the extension: this says
# that the extension should be rebuilt
# after any change to the files in ext

case RUBY_ENGINE
when 'jruby'
  jruby_files = Dir.glob("ext/#{NAME}_jruby/**/*{.rb,.java}")
  jruby_classes = jruby_files.map {|file| file.gsub('.java', '.class')}
  file "lib/#{NAME}/#{NAME}_jruby.jar" =>
      Dir.glob("ext/#{NAME}_jruby/*{.java}") do
    sh "javac -cp #{ENV_JAVA['jruby.home'] + '/lib/jruby.jar'} #{jruby_files.join(' ')}"
    sh "jar -cf lib/iconv/#{NAME}_jruby.jar #{jruby_classes.join(' ')}"
  end

  # make the :test task depend on the shared
  # object, so it will be built automatically
  # before running the tests
  task :test => "lib/#{NAME}/#{NAME}_jruby.jar"
else
  file "lib/#{NAME}/#{NAME}.so" =>
      Dir.glob("ext/#{NAME}/*{.rb,.c}") do
    Dir.chdir("ext/#{NAME}") do
      # this does essentially the same thing
      # as what RubyGems does
      ruby "extconf.rb", *ARGV.grep(/\A--/)
      sh "make", *ARGV.grep(/\A(?!--)/)
    end
    cp "ext/#{NAME}/#{NAME}.so", "lib/#{NAME}"
  end

  # make the :test task depend on the shared
  # object, so it will be built automatically
  # before running the tests
  task :test => "lib/#{NAME}/#{NAME}.so"
end

# use 'rake clean' and 'rake clobber' to
# easily delete generated files
CLEAN.include('ext/**/*{.o,.log,.so,.class}')
CLEAN.include('ext/**/Makefile')
CLOBBER.include('lib/**/*{.so,.jar}')

# the same as before
Rake::TestTask.new do |t|
  t.libs << 'test'
end

desc "Run tests"
task :default => :test
