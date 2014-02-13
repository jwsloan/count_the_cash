require "spec_helper"

describe Denomination do
  describe "singular_name capitalizes class name" do
    subject { [One.new, Five.new, Ten.new, Twenty.new] }
    it "should have correct singular_name" do
      subject.each { |s| s.singular_name.should == s.class.to_s.capitalize }
    end
  end
end
