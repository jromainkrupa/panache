class ClubPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def create?
    record.admin ==  user
  end

  def update?
    record.admin ==  user
  end

  def destroy?
    record.admin ==  user
  end
end
