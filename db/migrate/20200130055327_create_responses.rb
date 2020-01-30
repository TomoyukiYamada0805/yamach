class CreateResponses < ActiveRecord::Migration[6.0]
  def change
    create_table :responses do |t|
      t.references :thread_list, foreign_key: true, null: false
      t.references :user, foreign_key: true, null: false
      t.string :body, null: false

      t.timestamps
    end
  end
end
