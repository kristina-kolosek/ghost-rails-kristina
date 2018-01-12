class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :fullname, :slug, :email, presence: true

  before_validation(on: :create) do
    self.slug = fullname.downcase.split(" ").join("-")
  end
end
