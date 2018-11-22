class AddingOffenderToComplaints< ActiveRecord::Migration[5.2]  
  def self.up
  	
  	add_column :complaints, :offender_id, :integer
    add_index :complaints, :offender_id
  
  end

  def self.down
 	remove_column :complaints, :offender_id
    remove_index :complaints, :offender_id

  end
end