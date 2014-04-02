class RemoveColumns < ActiveRecord::Migration
  def change
    remove_column :contacts, :phone
    remove_column :contacts, :email
  end
end
