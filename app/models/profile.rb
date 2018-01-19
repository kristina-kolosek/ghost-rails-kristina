class Profile < ApplicationRecord
  belongs_to :user

  validates :full_name, :slug, presence: true

  before_validation :generate_slug, on: :create

  private

  def generate_slug
    self.slug = full_name.downcase.split(" ").join("-")
  end
end
