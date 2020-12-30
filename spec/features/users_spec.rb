require "rails_helper"

RSpec.feature "Users", type: :feature do
  context "create new user" do
    before(:each) do
      User.create(name: "user", phone: "0987987987", email: "user@gmail.com", password: "123456")
      User.create(name: "admin", phone: "0987987987", email: "admin@gmail.com", password: "123456", admin: true)
      visit tasks_path
    end
    scenario "should be successful" do
      visit admin_login_path
      fill_in "email", with: "admin@gmail.com"
      fill_in "password", with: "123456"
      click_button "登入"
      visit new_admin_user_path
      within("form") do
        fill_in "Name", with: "wells"
        fill_in "Phone", with: "0912407249"
        fill_in "Email", with: "jhang0912407249@gmail.com"
        fill_in "Password", with: "123456"
      end
      click_button "Create User"
      expect(page).to have_content("User was successfully created.")
    end
    scenario "should fail" do
    end
  end
  context "update task" do
  end
  context "destory task" do
  end
end
