class CreatePredictions < ActiveRecord::Migration[5.1]
  def change
    create_table :predictions do |t|
      t.belongs_to :user, foreign_key: true

      t.string :coin
      t.string :exchange
      t.string :currency
      t.string :prediction_type

      t.float :change_in_price
      t.float :current_value

      t.datetime :expiring_at

      t.timestamps
    end
  end
end
