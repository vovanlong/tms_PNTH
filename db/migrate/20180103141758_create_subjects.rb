class CreateSubjects < ActiveRecord::Migration[5.1]
  def change
    create_table :subjects do |t|
      t.string :name
      t.string :description
      t.integer :duration

      t.timestamps
    end
  end
end
