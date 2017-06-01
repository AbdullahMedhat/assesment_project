class AddGitHubUserNameToStudents < ActiveRecord::Migration[5.0]
  def change
    add_column :students, :gitHub_userName, :string
  end
end
