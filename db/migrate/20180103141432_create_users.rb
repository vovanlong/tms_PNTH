class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :reset_digest
      t.string :remember_digest
      t.integer :roles, default: 0
      t.string :address
      t.string :school

      t.timestamps
    end
  end
end
