class AddingAddressAndPostalToComplaint< ActiveRecord::Migration[5.2]  
  def self.up
  	
    add_column :complaints, :address, :string
    add_column :complaints, :postal_code, :string

  end

  def self.down
 
    remove_column :complaints, :address
    remove_column :complaints, :postal_code

  end
end