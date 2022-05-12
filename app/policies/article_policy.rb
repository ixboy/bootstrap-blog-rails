class ArticlePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def update?
    user.id == record.user.id
  end

  def destroy?
    user.id == record.user.id
  end

  def show?
    true
  end
end
