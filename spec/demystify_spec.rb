require 'rspec'
require 'demystify'


describe Demystify::Text do

  before :each do
    @sample = Demystify::Text.new('./sample1.txt')
  end

  describe '#char_count' do
    it "counts the characters in a text" do
      expect(@sample.char_count).to eq(50)
    end
  end
  
  describe '#char_count' do
    it "counts the characters in a text" do
      expect(@sample.char_count).to eq(50)
    end
  end


end
