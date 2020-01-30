class AddColumnCategoryName < ActiveRecord::Migration[6.0]
  def change
    add_column :category_names, :uid, :string, after: :id, null: false
  end
end
