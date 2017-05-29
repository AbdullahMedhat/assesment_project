class CreateSubmissions < ActiveRecord::Migration[5.0]
  def change
    create_table :submissions do |t|
      t.string :git_url
      t.string :info
      t.belongs_to :student, index: true
      t.belongs_to :mentor, index: true
      t.string :feedback
      t.string :status
      
      t.timestamps
    end
  end
end
