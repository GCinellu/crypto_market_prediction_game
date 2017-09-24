class AddExchangeToExchangePrice < ActiveRecord::Migration[5.1]
  def change
    add_column :exchange_prices, :exchange, :string
    add_column :exchange_prices, :coin, :string
    add_column :exchange_prices, :currency, :string
  end
end
