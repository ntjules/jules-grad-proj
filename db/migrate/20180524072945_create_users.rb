class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      
      t.string :name
      t.string :email, unique: true
      t.string :password_digest
      t.text   :image
      t.string :username, unique: true

      t.timestamps
    end
  end
end
