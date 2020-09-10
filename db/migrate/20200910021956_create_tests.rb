class CreateTests < ActiveRecord::Migration[6.0]
  def change
    create_table :tests do |t|
      t.integer :time,        null: false
      t.integer :number,      null: false
      t.text :question,       null: false
      t.text :choice,         null: false
      t.integer :answer,      null: false
      t.string :category
      t.timestamps
    end
  end
end
