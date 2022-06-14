class CommentPolicy < ApplicationPolicy
  def update?
    user&.id == record.user.id
  end

  def destroy?
    user&.id == record.user.id
  end
end
