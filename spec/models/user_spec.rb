require "rails_helper"

RSpec.describe User, type: :model do
  it { should have_db_column(:email).of_type(:string) }
  it { should have_db_column(:fullname).of_type(:string) }
  it { should have_db_column(:slug).of_type(:string) }
  it { should have_db_column(:biography).of_type(:string) }
  it { should have_db_column(:role).of_type(:integer) }
  it { should have_db_column(:email).of_type(:string) }
  it { should have_db_column(:encrypted_password).of_type(:string) }
  it { should have_db_column(:reset_password_token).of_type(:string) }
  it { should have_db_column(:reset_password_sent_at).of_type(:datetime) }
  it { should have_db_column(:remember_created_at).of_type(:datetime) }
  it { should have_db_column(:sign_in_count).of_type(:integer) }
  it { should have_db_column(:current_sign_in_at).of_type(:datetime) }
  it { should have_db_column(:last_sign_in_at).of_type(:datetime) }
  it { should have_db_column(:created_at).of_type(:datetime) }
  it { should have_db_column(:updated_at).of_type(:datetime) }

  before :each do
    @user = FactoryGirl.create(:user)
  end

  describe "Handling admins and authors" do
    it "should return admin for this user" do
      expect(@user.admin?).to be true
      expect(@user.author?).to be false
    end

    it "should change admin to author" do
      @user.author!
      @user.reload
      expect(@user.admin?).to be false
      expect(@user.author?).to be true
    end

    it "should change author to admin" do
      @user.author!
      @user.admin!
      @user.reload
      expect(@user.admin?).to be true
      expect(@user.author?).to be false
    end
  end
end
