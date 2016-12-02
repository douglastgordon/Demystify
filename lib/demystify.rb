module Demystify

  class Text

    attr_accessor :content, :chars

    def initialize(file)
      @content = open(file).read
      @chars = @content.split("")
    end

  

  end

end

something = Demystify::Text.new(File.join( File.dirname(__FILE__), '../sample1.txt'))

p something.chars
