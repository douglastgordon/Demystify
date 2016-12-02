module Demystify

  class Text

    attr_accessor :content, :chars

    def initialize(file)
      @content = open(file).read
      @chars = @content.split("")
    end

    def char_count
      @chars.length
    end

    def spaces_count
      count = 0
      @chars.each do |char|
        count+=1 if char == " "
      end
      count
    end



  end

end

something = Demystify::Text.new(File.join( File.dirname(__FILE__), '../sample1.txt'))

p something.chars
