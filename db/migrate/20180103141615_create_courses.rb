class CreateCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :courses do |t|
      t.string :name
      t.string :description
      t.integer :status
      t.datetime :start_at
      t.datetime :end_at

      t.timestamps
    end
  end
end
