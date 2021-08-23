class ChangeColumnNullTasks < ActiveRecord::Migration[5.2]
  change_column :tasks, :task_name, :string, null: false
end
