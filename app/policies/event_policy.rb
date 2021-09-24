class EventPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def new?
    true
  end

  def create?
    if record.club.present?
      record.club.admin == user
    else 
      true
    end
  end

  def update?
    record.organizer == user || user.is_admin?
  end

  def destroy?
    record.organizer == user || user.is_admin?
  end
end
