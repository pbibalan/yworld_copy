class AddUidAndCryptoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :uid, :string
    add_column :users, :crypto, :string
  end
end
