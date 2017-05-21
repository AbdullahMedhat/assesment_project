class CreatePrograms < ActiveRecord::Migration[5.0]
  def change
    create_table :programs do |t|
      t.string :name
      t.string :description
      t.date :startdate
      t.date :enddate
      t.timestamps
    end
  end
end
