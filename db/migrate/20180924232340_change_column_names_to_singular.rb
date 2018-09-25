class ChangeColumnNamesToSingular < ActiveRecord::Migration[5.2]
  def change
    rename_column :reviews, :users_id, :user_id
    rename_column :reviews, :ideas_id, :idea_id
  end
end
