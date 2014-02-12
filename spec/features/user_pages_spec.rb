require 'spec_helper'

describe "UserPages" do
=begin
  subject { page }
  
  describe "signup page" do 
    before { visit signup_path }

    it { should have_content "Sign up" }
    
    let(:submit) {"Save" }
  
    describe "with invalid information" do 
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in "Name",         :with => "Example"
        fill_in "Email",        :with => "user@example.com"
        fill_in "user_password",     :with => "password"
        fill_in "user_password_confirmation",     :with => "password"
      end
      
      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end
    end
  end
=end
end
