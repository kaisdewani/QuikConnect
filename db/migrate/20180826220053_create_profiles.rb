class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.string :personal_phone
      t.string :personal_address

      t.timestamps
    end
  end
end
