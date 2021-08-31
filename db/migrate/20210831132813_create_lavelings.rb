class CreateLavelings < ActiveRecord::Migration[5.2]
  def change
    create_table :lavelings do |t|
      t.references :task, foreign_key: true
      t.references :lavel, foreign_key: true

      t.timestamps
    end
  end
end
