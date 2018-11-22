class IndexNumberPlateToComplaint< ActiveRecord::Migration[5.2]  
  def self.up
  	
    add_index :complaints, :number_plate
  
  end

  def self.down
 
    remove_index :complaints, :number_plate

  end
end