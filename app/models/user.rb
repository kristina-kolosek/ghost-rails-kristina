class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # Associations
  after_initialize :create_role
  has_one :profile, dependent: :destroy, autosave: true

  delegate :full_name, to: :profile
  delegate :slug, to: :profile

  has_many :user_roles
  has_many :roles, through: :user_roles

  validates :email, :password, presence: true

  def admin?
    roles.any? { |role| role.role_type == "admin" }
  end

  private

  def create_role
    if User.count.zero?
      role = Role.where(role_type: "admin").take
    else
      role = Role.where(role_type: "author").take
    end
    UserRole.create(
      role: role,
      user: self,
    )
  end
end
