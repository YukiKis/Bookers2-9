class AddColumns1ToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :postcode, :integer
    add_column :users, :prefecture_code, :integer
    add_column :users, :address_city, :integer
    add_column :users, :address_street, :integer
    add_column :users, :address_building, :integer
  end
end
