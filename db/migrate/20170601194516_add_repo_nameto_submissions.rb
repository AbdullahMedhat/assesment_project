class AddRepoNametoSubmissions < ActiveRecord::Migration[5.0]
  def change
    add_column :submissions, :repoName, :string
  end
end
