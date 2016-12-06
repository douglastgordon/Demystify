require 'rspec'
require 'demystify'


describe Demystify::Text do

  before :each do
    @sample = Demystify::Text.new('./sample1.txt')
  end

  describe '#char_count' do
    it "counts the characters in a text" do
      expect(@sample.char_count).to eq(64)
    end
  end

  describe '#spaces_count' do
    it "counts the spaces in a text" do
      expect(@sample.spaces_count).to eq(6)
    end
  end

  describe '#new_line_count' do
    it "counts the new lines in a text" do
      expect(@sample.new_line_count).to eq(4)
    end
  end

  describe '#non_whitespace_char_count' do
    it "counts the new lines in a text" do
      expect(@sample.non_whitespace_char_count).to eq(54)
    end
  end


end