require "rails_helper"

RSpec.describe "Users" do
  describe "Registrations" do
    it "creates a new user" do
      visit register_path
      fill_in "user_email", with: "john@example.com"
      fill_in "user_fullname", with: "John Jonson"
      fill_in "user_password", with: "password"
      find(".button").click
      expect(current_path).to eql(root_path)
    end

    describe "Already 1 registered user" do
      before :each do
        @user = FactoryGirl.create(:user)
      end

      it "redirects to login if there is a registered user" do
        visit register_path
        expect(current_path).to eql(new_user_session_path)
      end
    end
  end

  describe "Sessions" do
    before :each do
      @user = FactoryGirl.create(:user)
    end

    describe "DELETE session#destroy" do
      it "destroy current user session" do
        login_as(@user, scope: :user)
        visit root_path
        find("#logout").click
        expect(current_path).to eql(new_user_session_path)
      end
    end

    describe "GET sessions#new" do
      it "creates new session for user" do
        visit new_user_session_path
        fill_in "user_email", with: @user.email
        fill_in "user_password", with: @user.password
        find(".button").click
        expect(current_path).to eql(root_path)
      end
    end
  end
end
