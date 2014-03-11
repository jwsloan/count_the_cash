require "spec_helper"

feature "UserPages" do
  
  it "should say 'Sign up" do
    visit root_path
    expect(page).to have_content("sign-up")
  end
  it "should have a sign in link", :js => true do 
    visit root_path 
    puts page.body
    click_link "Sign in"
#    click_link "Sign up now!"
#    fill_in :email, :with => user.email
#    fill_in :name, :with => user.name

#    Capybara.save_and_open_page
#    let(:submit) {"Save" }
  
#    describe "with invalid information" do 
#      it "should not create a user" do
#        expect { click_button submit }.not_to change(User, :count)
#      end
#    end

#    describe "with valid information" do
#      before do
#        fill_in "Name",         :with => "Example"
#        fill_in "Email",        :with => "user@example.com"
#        fill_in "user_password",     :with => "password"
#        fill_in "user_password_confirmation",     :with => "password"
###      end
      
#      it "should create a user" do
#        expect { click_button submit }.to change(User, :count).by(1)
#      end
#    end
  end
end
