class Ideas < ActiveRecord::Migration[5.2]
  def change
    create_table :ideas do |t|
      t.string :title
      t.text :body
      # t.references :user, foreign_key: true
      t.integer :likeCount
      t.timestamps
    end
  end
end
