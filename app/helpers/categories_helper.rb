module CategoriesHelper
  def edit_category_link(category)
    return unless policy(category).update?

    link_to 'Edit', edit_category_path(category),
            class: 'btn btn-primary'
  end

  def delete_category_link(category)
    return unless policy(category).destroy?

    link_to 'Destroy', category_path(category), data: {
      method: :delete,
      confirm: 'Are you sure?'
    }, class: 'btn btn-danger'
  end
end
