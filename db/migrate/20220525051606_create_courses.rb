class CreateCourses < ActiveRecord::Migration[6.1]
  def change
    create_table :courses do |t|
      t.string :course_number
      t.string :keywords
      t.string :satisfication
      t.integer :workload

      t.timestamps
    end
  end
end
