class AddPictureToIdeas < ActiveRecord::Migration[5.1]
  def change
    add_column :ideas, :picture, :string
  end
end
