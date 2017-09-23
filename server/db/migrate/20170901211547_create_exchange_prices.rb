class CreateExchangePrices < ActiveRecord::Migration[5.1]
  def change
    create_table :exchange_prices do |t|
      t.float :spot
      t.float :sell
      t.float :buy

      t.timestamps
    end
  end
end
