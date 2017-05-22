class AddUserIdToPrograms < ActiveRecord::Migration[5.0]
  def change
    add_column :programs, :user_id, :integer
  end
end
