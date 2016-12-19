require 'rspec'
require 'demystify'


describe Demystify::Text do

  before :each do
    @sample1 = Demystify::Text.new('./sample1.txt')
    @sample2 = Demystify::Text.new('./sample2.txt')
  end

  describe '#char_count' do
    it "counts the characters in a text" do
      expect(@sample1.char_count).to eq(64)
    end
  end

  describe '#spaces_count' do
    it "counts the spaces in a text" do
      expect(@sample1.spaces_count).to eq(6)
    end
  end

  describe '#new_line_count' do
    it "counts the new lines in a text" do
      expect(@sample1.new_line_count).to eq(4)
    end
  end

  describe '#non_whitespace_char_count' do
    it "counts the non-whitespace characters in a text" do
      expect(@sample1.non_whitespace_char_count).to eq(54)
    end
  end

  describe '#punctuation_count' do
    it "counts the punctuation marks in a text" do
      expect(@sample1.punctuation_count).to eq(8)
    end
  end

  describe '#symbol_count' do
    it "counts the symbols in a text" do
      expect(@sample1.symbol_count).to eq(1)
    end
  end

  describe '#non_letter_count' do
    it "counts the non-letters in a text" do
      expect(@sample1.non_letter_count).to eq(9)
    end
  end

  describe '#letter_count' do
    it "counts the letters in a text" do
      expect(@sample1.letter_count).to eq(53)
    end
  end

  describe '#sequence_count(sequence)' do
    it "counts the occurrences of a particular sequence in a text" do
      expect(@sample1.sequence_count(".a")).to eq(2)
      expect(@sample1.sequence_count("l")).to eq(3)
    end
  end

  describe '#word_count' do
    it "counts number of words in a text" do
      expect(@sample2.word_count).to eq(124)
    end
  end

  describe '#sentence_count' do
    it "counts number of sentences in a text" do
      expect(@sample2.sentence_count).to eq(5)
    end
  end



end
