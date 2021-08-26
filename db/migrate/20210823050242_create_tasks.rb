class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :task_name
      t.string :to_do
      t.date :deadline
      t.integer :status
      t.integer :priority

      t.timestamps
    end
  end
end
