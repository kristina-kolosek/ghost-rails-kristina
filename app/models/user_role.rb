class UserRole < ApplicationRecord
  belongs_to :user
  belongs_to :role

  delegate :role_type, to: :role
end
