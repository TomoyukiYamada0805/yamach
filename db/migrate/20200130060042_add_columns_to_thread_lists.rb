class AddColumnsToThreadLists < ActiveRecord::Migration[6.0]
  def change
    add_column :thread_lists, :uid, :string, after: :id, null: false
  end
end
