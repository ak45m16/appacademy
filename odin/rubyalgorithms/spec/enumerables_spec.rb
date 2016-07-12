require './spec_helper'

describe '.my_count' do
  context "counts elements of array" do
    it "[1,2,3,4,5] should have 5 counts" do
      [1,2,3,4,5].my_count.should == 5
    end
  end

  context "counts elements of array" do
    it "[] should have 0 counts" do
      [].my_count.should == 0
    end
  end
end

describe '.my_select' do
  context "produces new array with constraint" do
    it "[1,2,3,4,5].select {|i| i%2==0}" do
      [1,2,3,4,5].select {|i|i%2==0}.should == [2,4]
    end
  end

  context "produces new array with constraint" do
    it "[1,2,3,4,5].select {|i| i}" do
      [1,2,3,4,5].select {|i|i}.should == [1,2,3,4,5]
    end
  end
end

describe '.my_all?' do
  context "checks if all elements satisfy condition" do
    it "[2,4,6,8].all? {|i| i%2==0}" do
      [2,4,6,8].all? {|i|i%2==0}.should == true
    end
  end

  context "checks if all elements satisfy condition" do
    it "[2,4,6,8,9].all? {|i| i%2==0}" do
      [2,4,6,8,9].all? {|i|i%2==0}.should == false
    end
  end
end