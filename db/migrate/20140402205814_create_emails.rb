class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
      t.column :address, :string
      t.column :contact_id, :integer

      t.timestamps
    end
  end
end
