class AddRoleToOfficers < ActiveRecord::Migration[5.2]
  def change
    add_column :officers, :role, :integer, default: 0
  end
end
