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

    it "loads content sections" do
      @loader.book["Getting Started", "Festivals & Events"].should_not == nil
    end

    describe "each Section" do

      before do
        @festivals_section = @loader.book["Getting Started", "Festivals & Events"]
      end

      it "has body HTML" do
        @festivals_section.body.should =~ %r{^<p>The annual calendar is a never-ending procession of parties}
      end

    end

  end

end
