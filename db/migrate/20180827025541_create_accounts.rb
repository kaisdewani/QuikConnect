class CreateAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :accounts do |t|
      t.string :linkedin
      t.string :github
      t.string :facebook
      t.string :instagram
      t.string :email

      t.timestamps
    end
  end
end
