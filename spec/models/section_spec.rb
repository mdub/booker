require 'spec_helper'

describe Section do

  it "has a body" do
    section = Section.create(:body => "blah blah")
    section.body.should == "blah blah"
  end

  describe "with links" do

    before do
      @section1 = Section.create(:body => "This is section 1")
      @section2 = Section.create(:body => "This is section 2")
      @link = @section1.links.build(:label => "Introduction", :to => @section2)
    end

    describe "#links" do

      it "returns links from this section" do
        @section1.links.should == [@link]
      end

      it "can be indexed by label" do
        @section1.links["Introduction"].should == @link
      end

    end

  end

  describe "#subsection" do
    
    before do
      @london = Section.create
      @london_intro = Section.create(:body => "Intro to London")
      @london.links.build(:label => "Introduction", :to => @london_intro)
    end

    describe "(name_of_existing_subsection)" do
      
      it "returns the linked section" do
        @london.subsection("Introduction").should == @london_intro
      end

    end
    
  end
  
end
