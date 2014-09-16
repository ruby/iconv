
case RUBY_ENGINE
when 'jruby'
  require "jruby-iconv.jar"
  org.jruby.ext.iconv.IConvLibrary.new.load(JRuby.runtime, false)
else
  require "iconv/iconv.so"
end

require "iconv/version"

class Iconv < Data
  # Your code goes here...
end
