class CreateStudies < ActiveRecord::Migration[6.0]
  def change
    create_table :studies do |t|
      t.references :user, foreign_key: true
      t.references :test, foreign_key: true
      t.timestamps
      t.index [:user_id, :test_id], unique: true
    end
  end
end
