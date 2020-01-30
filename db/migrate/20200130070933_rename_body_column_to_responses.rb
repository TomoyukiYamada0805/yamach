class RenameBodyColumnToResponses < ActiveRecord::Migration[6.0]
  def change
    rename_column :responses, :body, :comment
  end
end
