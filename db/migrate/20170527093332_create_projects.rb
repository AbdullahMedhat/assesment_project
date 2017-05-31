class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :github_url
      t.belongs_to :program, foreign_key: true
      t.boolean :done , default: false
      t.timestamps
    end
  end
end
