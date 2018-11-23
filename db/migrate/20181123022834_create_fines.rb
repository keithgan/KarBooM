class CreateFines < ActiveRecord::Migration[5.2]
  def change
    create_table :fines do |t|

      t.timestamps
    end
  end
end
