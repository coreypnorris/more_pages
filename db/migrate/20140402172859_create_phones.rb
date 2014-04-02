class CreatePhones < ActiveRecord::Migration
  def change
    create_table :phones do |t|
      t.column :number, :integer
      t.column :contact_id, :integer

      t.timestamps
    end
  end
end
