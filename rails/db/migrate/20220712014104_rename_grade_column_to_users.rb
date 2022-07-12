class RenameGradeColumnToUsers < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :grade, :grade_id
  end
end
