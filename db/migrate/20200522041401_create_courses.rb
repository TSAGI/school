class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
      t.string :name
      t.text :description
      t.string :day
      t.string :time
      t.string :date
      t.integer :teacher_id

      t.timestamps
    end
  end
end
