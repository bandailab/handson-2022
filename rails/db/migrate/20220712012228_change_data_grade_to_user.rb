class ChangeDataGradeToUser < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :grade_id, :integer
  end
end
