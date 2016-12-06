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


end
