class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.text :description
      t.string :first_name
      t.string :last_name
      t.string :email, null: false, default: ""
      t.text :description
      t.string :encrypted_password, null: false, default: ""
      t.timestamps
    end
  end
end
