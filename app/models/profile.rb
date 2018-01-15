class Profile < ApplicationRecord
  belongs_to :user

  validates :fullname, :slug, :role, presence: true

  ADMIN = 1
  AUTHOR = 2

  before_validation(on: :create) do
    puts fullname
    self.slug = fullname.downcase.split(" ").join("-")
  end

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
end
