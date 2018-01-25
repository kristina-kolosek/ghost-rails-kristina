require "rails_helper"

RSpec.describe "Profiles" do
  let! :each do
    @user = create(:user)
    login_as(@user)
  end

  describe "GET profiles#edit" do
    before :each do
      visit edit_profile_path(@user.slug)
    end

    it "should update user fullname" do
      fill_in "profile_full_name", with: "Test User"
      find(".actionbtn").click
      @user.reload
      expect(@user.profile.full_name).to eq "Test User"
    end

    it "should update user slug" do
      fill_in "profile_slug", with: "test"
      find(".actionbtn").click
      @user.reload
      expect(@user.profile.slug).to eq "test"
    end

    it "should update user email" do
      fill_in "profile_user_email", with: "test@example.com"
      find(".actionbtn").click
      @user.reload
      expect(@user.reload.email).to eq "test@example.com"
    end

    it "should update user bio" do
      fill_in "profile_biography", with: "bio"
      find(".actionbtn").click
      @user.reload
      expect(@user.profile.biography).to eq "bio"
    end

    it "should stay on user edit page after saved" do
      fill_in "profile_biography", with: "bio"
      find(".actionbtn").click
      expect(current_path).to eql(edit_profile_path(@user.slug))
    end
  end
end
