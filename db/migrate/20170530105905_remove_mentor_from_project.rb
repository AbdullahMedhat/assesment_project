class RemoveMentorFromProject < ActiveRecord::Migration[5.0]
  def change
    remove_column :projects, :mentor, :string
  end
end
