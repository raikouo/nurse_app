class CreateTests < ActiveRecord::Migration[6.0]
  def change
    create_table :tests do |t|
      t.integer :exam_id,     null: false
      t.integer :number,      null: false
      t.text :question,       null: false
      t.text :choice,         null: false
      t.integer :answer,      null: false
      t.integer :category_id, null: false
      t.references :user,     null: false, foreign_key: true
      t.timestamps
    end
  end
end
