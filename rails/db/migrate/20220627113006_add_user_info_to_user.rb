class AddUserInfoToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :grade, :string
    add_column :users, :research_theme, :string
    add_column :users, :introduction, :string
  end
end
