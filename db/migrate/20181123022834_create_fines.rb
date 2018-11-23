class CreateFines < ActiveRecord::Migration[5.2]
  def change
    create_table :fines do |t|
      t.string :date, null: false
      t.string :time, null: false
      t.string :location, null: false
      t.string :offence, null: false
      t.integer :amount, null: false
      t.integer :status, default: 0
      t.references :user, foreign_key: true
      t.references :officer, foreign_key: true
      t.references :complaint, foreign_key: true

      t.timestamps
    end
  end
end
