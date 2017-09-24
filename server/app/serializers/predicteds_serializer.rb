class PredictedsSerializer < ActiveModel::Serializer
  attributes :coin, :exchange, :currency, :prediction_type,
             :change_in_price, :value_at_expiration, :value_at_time,
             :expired_at
end