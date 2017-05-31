class AddBioToStudent < ActiveRecord::Migration[5.0]
  def change
    add_column :students, :bio, :text
  end
end
