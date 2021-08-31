class RenameFromlabelToLabel < ActiveRecord::Migration[5.2]
  def change
    rename_table :labels, :labels
    rename_table :labelings, :labelings
    rename_column :labels, :label_name, :label_name
    rename_column :labelings, :label_id, :label_id
  end
end
