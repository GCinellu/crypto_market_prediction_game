class PredictionsSerializer < ActiveModel::Serializer
  attributes :coin, :exchange, :currency, :prediction_type,
             :change_in_price, :current_value, :expiring_at
end