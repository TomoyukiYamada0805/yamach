class AddColumnsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :uid, :string, null: false, after: :id
    add_column :users, :authority, :string, null: false
  end
end
