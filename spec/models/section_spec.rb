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

end
