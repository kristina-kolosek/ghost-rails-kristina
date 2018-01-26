require "rails_helper"

RSpec.describe ProfilesHelper, type: :helper do
  let! :each do
    @user = create(:user)
    login_as(@user)
  end

  it "should return correct slug format" do
    slug = helper.display_slug(@user.profile)
    expect(slug).to eq "http://kolosek.com/author/john-doe"
  end
end
