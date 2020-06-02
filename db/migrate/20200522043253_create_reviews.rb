class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.text :message
      t.integer :student_id
      t.integer :course_id

      t.timestamps
    end
  end
end
