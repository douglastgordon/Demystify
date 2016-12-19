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

    attr_accessor :content, :chars, :words

    def initialize(file)
      @content = open(file).read
      @chars = @content.split("")
      @words = @content.split(/[^[[:word:]]]+/)
      @sentences = make_sentences
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
      @words.count
    end

    def sentence_count
      @sentences.length
    end

    def first_words_of_sentences
      first_words = []
      @sentences.each do |sentence|
        first_words << sentence.first
      end
      first_words
    end

    def last_words_of_sentences
      last_words = []
      @sentences.each do |sentence|
        last_words << sentence.last
      end
      last_words
    end

    private

    def make_sentences
      sentence_regex = /((?<=[a-z0-9)][.?!])|(?<=[a-z0-9][.?!]"))\s+(?="?[A-Z])/
      sentences = @content.split(sentence_regex)
      sentences.select!{|sentence| sentence.length > 1}
      sentences.map{|sentence| sentence.chomp}
    end

  end

end
