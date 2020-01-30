class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.references :thread_list, foreign_key: true, null: false
      t.string :category_name_id, foreign_key: true, null: false

      t.timestamps
    end
  end
end
