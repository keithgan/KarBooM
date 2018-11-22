class AddingFineToComplaint< ActiveRecord::Migration[5.2]  
  def self.up
  	
    add_column :complaints, :fine, :integer

  end

  def self.down
 
    remove_column :complaints, :fine

  end
end