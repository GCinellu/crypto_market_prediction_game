class CreatePredicteds < ActiveRecord::Migration[5.1]
  def change
    create_table :predicteds do |t|
      t.belongs_to :user, foreign_key: true
      t.float :amount
      t.datetime :expiration
      t.string :coin
      t.float :coin_price_at_datetime

      t.timestamps
    end
  end
end
