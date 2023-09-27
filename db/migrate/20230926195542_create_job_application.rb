class CreateJobApplication < ActiveRecord::Migration[7.0]
  def change
    create_table :job_applications do |t|
      t.integer :job_id
      t.integer :user_id
      t.boolean :seen, default: false

      t.timestamps
    end
  end
end
