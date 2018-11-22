class AddingUserIdToComplaint< ActiveRecord::Migration[5.2]  
  def self.up
  	
    add_column :complaints, :user_id, :integer

  end

  def self.down
 
    remove_column :complaints, :user_id

  end
end