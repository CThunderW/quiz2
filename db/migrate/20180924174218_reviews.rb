class Reviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.text :body
      t.references :users, foreign_key: true
      t.references :ideas, foreign_key: true
    end
  end
end
