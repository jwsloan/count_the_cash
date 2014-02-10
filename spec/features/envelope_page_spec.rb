require 'spec_helper'

describe "Home page" do
  before { visit root_path }
  subject { page }

  it { should have_title('Count the Cash!') }
  it { should have_content('Count the Cash!') }
  
  it "should have 4 denomination subclasses" do
    Denomination.subclasses.count.should == 4
  end
end

