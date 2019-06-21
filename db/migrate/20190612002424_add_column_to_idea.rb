class AddColumnToIdea < ActiveRecord::Migration[5.1]
  def change
    add_column :ideas, :user_id, :string
  end
end
