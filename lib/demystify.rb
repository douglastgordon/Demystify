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

    attr_accessor :content,
                  :chars,
                  :words,
                  :sentences,
                  :forwards_probability_hash,
                  :backwards_probability_hash,
                  :first_words,
                  :last_words

    def initialize(file)
      @content = open(file).read
      @chars = @content.split("")
      @words = @content.split(/[^[[:word:]]]+/)
      make_sentences
      make_probability_hashes
      make_first_and_last_words
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

    private

    def make_first_and_last_words
      @first_words = []
      @last_words = []
      @sentences.each do |sentence|
        split_sentence = sentence.split(" ")
        @first_words << split_sentence.first
        @last_words << split_sentence.last
      end
    end

    def make_sentences
      sentence_regex = /((?<=[a-z0-9)][.?!])|(?<=[a-z0-9][.?!]"))\s+(?="?[A-Z])/
      sentences = @content.split(sentence_regex)
      sentences.select!{|sentence| sentence.length > 1}
      @sentences = sentences.map{|sentence| sentence.chomp}
    end

    def make_probability_hashes
      @forwards_probability_hash = Hash.new { |h, k| h[k] = [] }
      @backwards_probability_hash = Hash.new { |h, k| h[k] = [] }
      @sentences.each do |sentence|
        sentence_array = sentence.split(" ")
        sentence_array.each_with_index do |word, i|
          unless i == sentence_array.length - 1
            @forwards_probability_hash[word] << sentence_array[i+1]
          end
          unless i == 0
            @backwards_probability_hash[word] << sentence_array[i-1]
          end
        end
      end
    end

  end

end
