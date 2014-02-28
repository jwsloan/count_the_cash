require 'spec_helper'
include SessionsHelper
describe EnvelopesController do
  describe "a new envelope has the correct denominations" do
    before(:each) do
      @attr = { :name => "test", :category => "test", :additional_amount => 36 }
      post :create, :envelope => @attr, :format => "js"
    end

    it "should not have a null envelope after create" do
      assigns[:envelope].should_not be_nil
    end

    it "should have one of each denomination" do
      @controller.instance_eval{@envelope}.denominations.each { |d| d.count_in_envelope.should == 1}
    end

    it "should have 4 denomination subclasses" do
      Denomination.subclasses.count.should == 4
    end
  end
end

