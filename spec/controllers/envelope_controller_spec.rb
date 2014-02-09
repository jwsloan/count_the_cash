require 'spec_helper'

describe EnvelopesController do
  describe "a new envelope has the correct denominations" do
    before(:each) do
      @attr = { :name => "test", :category => "test", :additional_amount => 36 }
    end

    #subject { Envelope.create :name => "test",
    #                          :category => "test",
    #                          :additional_amount => 36 }
    it "should not have a null envelope after create" do
      post :create, :envelope => @attr, :format => "js"
      assigns[:envelope].should_not be_nil
    end

    it "should have one of each denomination" do
      post :create, :envelope => @attr, :format => "js"
      @controller.instance_eval{@envelope}.denominations.each { |d| d.count_in_envelope.should == 1}
    end
  end
end

