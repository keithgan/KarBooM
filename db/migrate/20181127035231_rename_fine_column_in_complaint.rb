class RenameFineColumnInComplaint < ActiveRecord::Migration[5.2]
  def change
    add_column :complaints, :fine_amount, :integer

    remove_column :complaints, :fine, :integer
  end
end
