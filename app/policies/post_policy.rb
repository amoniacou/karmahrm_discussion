class PostPolicy < ApplicationPolicy
  def update?
    record.employee.user == user
  end
  class Scope < Struct.new(:user, :scope)
    def resolve
      scope
    end
  end
end
