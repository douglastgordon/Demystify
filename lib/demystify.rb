module Demystify

  class Text

    attr_accessor :content

    def initialize(file)
      @content = File.open(file)
    end

  end

end

something = Demystify::Text.new(File.join( File.dirname(__FILE__), '../sample1.txt'))
