class RemoveGithubFromProject < ActiveRecord::Migration[5.0]
  def change
    remove_column :projects, :github_url, :string
    add_column :projects, :description, :text
  end
end
