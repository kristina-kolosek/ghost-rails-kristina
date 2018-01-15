class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :fullname, :slug, :email, :role, :password, presence: true

  ADMIN = 1
  AUTHOR = 2

  before_validation(on: :create) do
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
