
case RUBY_ENGINE
when 'jruby'
  require "iconv/iconv_jruby.jar"
  org.jruby.ext.iconv.IConvLibrary.new.load(JRuby.runtime, false)
else
  require "iconv/iconv.so"
end

require "iconv/version"

class Iconv
  # Your code goes here...
end
