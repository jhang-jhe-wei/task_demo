require "rails_helper"

RSpec.feature "Users", type: :feature do
  context "create new user" do
    scenario "should be successful" do
      visit new_user_path
      within("form") do
        fill_in "Name", with: "wells"
        fill_in "Phone", with: "0912407249"
        fill_in "Email", with: "jhang0912407249@gmail.com"
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
