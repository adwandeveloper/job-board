class CreateJobs < ActiveRecord::Migration[7.0]
  def change
    create_table :jobs do |t|
      t.string :user_id
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
