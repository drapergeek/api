class ProductPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def new?
    user.admin?
  end

  def destroy?
    user.admin?
  end

  def answers?
    true
  end
end
