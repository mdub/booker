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

    it "returns a Section, representing the book" do
      @loader.book.should be_kind_of(Section)
    end

    describe "the book" do
      
      it "has links to each loaded chapter" do
        @loader.book.should have(1).link
        @loader.book.links[0].label.should == "Getting Started"
      end
      
    end
    
  end
  
end
