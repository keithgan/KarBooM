class AddingColumnsToComplaint< ActiveRecord::Migration[5.2]  
  def self.up
  	
    add_column :complaints, :latitude, :float
    add_column :complaints, :longitude, :float
    add_column :complaints, :comment, :string
    add_column :complaints, :offence, :string
    add_column :complaints, :number_plate, :string
    add_column :complaints, :avatar, :string
  end

  def self.down
 
    remove_column :complaints, :latitude
    remove_column :complaints, :longitude
    remove_column :complaints, :comment
    remove_column :complaints, :offence
    remove_column :complaints, :number_plate
    remove_column :complaints, :avatar
  end
end