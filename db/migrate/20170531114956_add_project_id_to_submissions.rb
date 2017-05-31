class AddProjectIdToSubmissions < ActiveRecord::Migration[5.0]
  def change
    add_column :submissions, :project_id, :integer
  end
end
