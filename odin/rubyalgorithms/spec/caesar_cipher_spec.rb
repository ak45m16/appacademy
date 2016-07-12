require './spec_helper'

describe '#caesar_cipher' do
  context "no spaces" do
    it "translates abc to bcd" do
      caesar_cipher("abc", 1).should == "bcd"
    end
  end

  context "with spaces" do
    it "translates ab c to bc d" do
      caesar_cipher("ab c", 1).should == "bc d"
    end
  end

  context "words with z loop over to a" do
    it "translates xyz to yza" do
      caesar_cipher("xyz", 1).should == "yza"
    end
  end

  context "different case translates" do
    it "translates AbC to BcD" do
      caesar_cipher("AbC", 1).should == "BcD"
    end
  end

  context "abc with 3 letter displacement" do
    it "translates abc to bcd" do
      caesar_cipher("abc", 3).should == "def"
    end
  end

end