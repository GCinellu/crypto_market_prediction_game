class CreatePredicteds < ActiveRecord::Migration[5.1]
  def change
    create_table :predicteds do |t|
      t.belongs_to :user, foreign_key: true

      t.string :coin
      t.string :exchange
      t.string :currency
      t.string :prediction_type

      t.float :change_in_price
      t.float :value_at_expiration
      t.float :value_at_time

      t.datetime :expired_at

      t.timestamps
    end
  end
end
