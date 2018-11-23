class AddStatusToComplaints < ActiveRecord::Migration[5.2]
  def self.up
  	
    add_column :complaints, :status, :integer, default: 0
  end

  def self.down
 
    remove_column :complaints, :status
  end
end
