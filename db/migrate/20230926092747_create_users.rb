class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.integer :user_type
      t.string :password
      t.string :password_digest
      t.string :authentication_token

      t.timestamps
    end
  end
end
