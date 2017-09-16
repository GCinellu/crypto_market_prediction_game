class CreatePredictions < ActiveRecord::Migration[5.1]
  def change
    create_table :predictions do |t|
      t.belongs_to :user, foreign_key: true
      t.float :amount
      t.datetime :expiration
      t.string :coin

      t.timestamps
    end
  end
end
