class CreateSubmissions < ActiveRecord::Migration[5.0]
  def change
    create_table :submissions do |t|
      t.string :git_url
      t.string :info
      t.belongs_to :student, index: true
      t.belongs_to :mentor, index: true
      t.belongs_to :project, index: true
      t.string :feedback
      t.integer :grade

      t.timestamps
    end
  end
end
