class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :firstname
      t.string :lastname
      t.date :birthday
      t.string :gender
      t.string :email
      t.string :phonenumber
      t.string :subject

      t.timestamps
    end
  end
end
