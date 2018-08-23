class CreateAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :accounts do |t|
      t.string :name
      t.string :url
      t.string :phone_number
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
