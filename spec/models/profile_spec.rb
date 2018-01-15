require 'rails_helper'

RSpec.describe Profile, type: :model do
  it { should have_db_column(:fullname).of_type(:string) }
  it { should have_db_column(:slug).of_type(:string) }
  it { should have_db_column(:biography).of_type(:string) }
  it { should have_db_column(:role).of_type(:integer) }

  before :each do
    user = FactoryGirl.create(:user)
    @profile = user.profile
  end

  describe "Handling admins and authors" do
    it "should return admin for this profile" do
      expect(@profile.admin?).to be true
    end

    it "should change admin to author" do
      @profile.author!
      @profile.reload
      expect(@profile.author?).to be true
    end

    it "should change author to admin" do
      @profile.author!
      @profile.admin!
      @profile.reload
      expect(@profile.admin?).to be true
    end
  end
end
