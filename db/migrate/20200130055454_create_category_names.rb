class CreateCategoryNames < ActiveRecord::Migration[6.0]
  def change
    create_table :category_names do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end
