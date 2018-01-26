class ProfilePolicy < ApplicationPolicy
  def index?
    user.admin?
  end

  def edit?
    user.admin? || user.id == record.user.id
  end
end
