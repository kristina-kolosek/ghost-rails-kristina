require "rails_helper"

RSpec.describe Role, type: :model do
  it { should have_db_column(:role_type).of_type(:string) }
end
