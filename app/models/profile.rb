class Profile < ApplicationRecord
  belongs_to :user

  validates :fullname, :slug, :role, presence: true

  ADMIN = 1
  AUTHOR = 2

  before_validation :generate_slug, on: :create

  def admin?
    role == ADMIN
  end

  def admin
    self.role = ADMIN
  end

  def admin!
    self.role = ADMIN
    save!
  end

  def author?
    role == AUTHOR
  end

  def author
    self.role = AUTHOR
  end

  def author!
    self.role = AUTHOR
    save!
  end

  private

  def generate_slug
    self.slug = fullname.downcase.split(" ").join("-")
  end
end
