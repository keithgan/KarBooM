class ChangeDataTypeForOfficerLocalityInOfficers < ActiveRecord::Migration[5.2]
  def self.up
  	remove_column :officers, :officer_locality, :string
    add_column :officers, :officer_locality, :integer
  end

  def self.down
    remove_column :officers, :officer_locality, :integer
    add_column :officers, :officer_locality, :string
  end
end

