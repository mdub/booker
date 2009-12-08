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
      @link = SectionLink.create(:from => @section1, :label => "Introduction", :to => @section2)
    end

    describe "#links" do

      it "returns links from this section" do
        @section1.links.should == [@link]
      end

    end

    describe "#outbound_links" do

      it "is an alias for #links" do
        @section1.outbound_links.should == [@link]
      end

    end

    describe "#inbound_links" do

      it "returns links to this section" do
        @section2.inbound_links.should == [@link]
      end

    end

  end

end
