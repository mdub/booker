require 'spec_helper'

describe ShivaLoader do
  
  before do
    @loader = ShivaLoader.new
  end
    
  describe "when loading a Shiva output file" do
    
    before do
      File.open("#{fixture_dir}/04-getting_started-ams6.xml") do |xml|
        @loader.load(xml)
      end
    end

    it "reconstructs a Book" do
      @loader.book.should_not == nil
    end

    describe "the Book" do

      it "has a title" do
        @loader.book.title.should == "Amsterdam-6"
      end
      
      it "has links to each loaded chapter" do
        @loader.book.should have(1).link
        @loader.book.links[0].label.should == "Getting Started"
      end

    end
    
  end
  
end
