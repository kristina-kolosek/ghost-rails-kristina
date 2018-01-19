require "rails_helper"

RSpec.describe Profile, type: :model do
  it { should have_db_column(:full_name).of_type(:string) }
  it { should have_db_column(:slug).of_type(:string) }
  it { should have_db_column(:biography).of_type(:text) }
end
