class CreateWallets < ActiveRecord::Migration[7.0]
  def change
    create_table :wallets do |t|
      t.references :User, null: false, foreign_key: true
      t.string :netwallet
      t.integer :saldo

      t.timestamps
    end
  end
end
