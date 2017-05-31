class AddGradesToSubmissions < ActiveRecord::Migration[5.0]
  def change
    add_column :submissions, :grade, :integer
    remove_column :submissions, :status, :string
  end
end
