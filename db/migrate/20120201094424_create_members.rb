class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :email
      t.string :name
      t.string :address
      t.string :postcode
      t.string :city
      t.string :country

      t.timestamps
    end
  end
end
