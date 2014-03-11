require "spec_helper"

feature "UserPages" do
  subject { page }
  before :each do 
    visit root_path
  end 

  let(:submit) { "Save" }

  it { should have_content "sign-up"  }

  it { should have_link "Sign in" }

  scenario "clicking Sign-in provides a sign up link", :js => true do
    click_link "Sign in"
    expect(page).to have_link "Sign up now!"      
  end

#    fill_in :email, :with => user.email
#    fill_in :name, :with => user.name

#    Capybara.save_and_open_page
  
#   describe "with invalid information" do 
#     it "should not create a user" do
#       expect { click_button submit }.not_to change(User, :count)
#     end
#   end

    describe "with valid information", :js => true do
      before do
        click_link "Sign in"
        click_link "Sign up now!"

        fill_in "Name",         :with => "Example"
        fill_in "Email",        :with => "user@example.com"
        fill_in "user_password",     :with => "password"
        fill_in "user_password_confirmation",     :with => "password"
      end

      it "should have a filled-in form" do
        find_field("Name").value.should eq "Example"
        find_field("Email").value.should eq "user@example.com"
        find_field("user_password").value.should eq "password"
        find_field("user_password_confirmation").value.should eq "password"
      end

     it "should create a user" do
       #expect { click_button submit }.to change(User, :count).by(1)
       click_button submit
       expect(page).to have_link("New Envelope")
     end
    end
  #end
end
