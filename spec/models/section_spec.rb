require 'spec_helper'

describe Section do

  it "has a body" do
    section = Section.create(:body => "blah blah")
    section.body.should == "blah blah"
  end
  
end
