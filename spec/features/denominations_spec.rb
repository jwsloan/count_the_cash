require 'spec_helper'

describe "Denomination Model" do
  describe "singular_name capitalizes class name" do
    subject { [One.new, Five.new, Ten.new, Twenty.new] }
    it "should have correct singular_name" do
      subject.each { |s| s.singular_name.should == s.class.to_s.capitalize }
    end
  end 

  describe "a new envelope has the correct denominations" do
    subject { Envelope.create :name => "test",
                              :category => "test",
                              :additional_amount => 36 }
    it "should have 4 total denominations" do
      subject.denominations.count.should == 4
    end

    it "should have one of each denomination" do
      subject.denominations.each { |d| d.count_in_envelope.should == 1}
    end
  end
end

