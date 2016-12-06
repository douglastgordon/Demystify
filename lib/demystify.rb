module Demystify

  Punctuation = ['.', ',', ':', ';', '?', '!', ]

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
        count += 1 if char == " "
      end
      count
    end

    def new_line_count
      count = 0
      @chars.each do |char|
        count += 1 if char == "\n"
      end
      count
    end

    def non_whitespace_char_count
      char_count - (spaces_count + new_line_count)
    end

    def punctuation_count
      count = 0
      @chars.each do |char|
        count += 1 if Demystify::Puntuation.include?(char)
      end
      count
    end



  end

end

something = Demystify::Text.new(File.join( File.dirname(__FILE__), '../sample1.txt'))
