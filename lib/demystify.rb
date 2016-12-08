require 'byebug'
module Demystify

  #From wikipedia
  Punctuation = ['[', ']', '(', ')', '{', '}', '⟨', '⟩', ':', ',', '،',
                 '、', '‒', '–', '—', '―', '…', '!', '.', '‹', '›', '«',
                 '»', '‐', '-', '?', "‘", "’", "“", "”", "'", "\""]

  Symbols = ['&', '*', '@', '\\', '/', '•', '^', '†', '‡', '°', '″', '¡', '¿',
            '※', '#', '№', '÷', '×', 'º', 'ª', '%', '‰', '+', '−', '=',
            '‱', '¶', '′', '″', '‴', '§', '~', '_', '|', '‖', '¦', '⁂',
            '❧', '☞', '‽', '⸮', '◊', '⁀']

  Intellectual_property = ['©', '℗', '®', '℠', '™']

  # Currency = ["¤", "₳",​ "฿", "₵", "¢", "₡", "₢", "$", "₫", "₯", "₠", "€",
  #             "ƒ", "₣", "₲", "₴", "₭", "₺", "ℳ", "₥", "₦", "₧", "₱", "₰",
  #             ​"£", "៛", "₨", "₪", "৳", ​"₮", "₩", "¥"]

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
        count += 1 if Punctuation.include?(char)
      end
      count
    end

    def symbol_count
      count = 0
      @chars.each do |char|
        count += 1 if Symbols.include?(char)
      end
      count
    end

    def intellectual_property_count
      count = 0
      @chars.each do |char|
        count += 1 if Intellectual_property.include?(char)
      end
      count
    end

    def non_letter_count
      punctuation_count + symbol_count + intellectual_property_count
    end

    def letter_count
      char_count - (spaces_count + new_line_count + symbol_count + intellectual_property_count)
    end

    def sequence_count(sequence)
      count = 0
      i = 0
      while i < (@chars.length - sequence.length)
        # puts @chars[i...sequence.length].join("")
        if @chars[i...(i+sequence.length)].join("") == sequence
          count += 1
        end
        i += 1
      end
      count
    end

    def word_count
      @content.split(/[^[[:word:]]]+/)
    end

  end

end

something = Demystify::Text.new(File.join( File.dirname(__FILE__), '../sample1.txt'))
