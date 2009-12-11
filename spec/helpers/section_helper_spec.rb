require 'spec_helper'

describe SectionHelper do

  describe "#book_section_path" do
    
    it "encodes unsafe characters" do
      encoded_path = helper.book_section_path("A BOOK", ["X Y", "foo/bar", "thing?"])
      encoded_path.should == "/books/A%20BOOK/X%20Y/foo%2Fbar/thing%3F"
    end
    
  end
  
end
