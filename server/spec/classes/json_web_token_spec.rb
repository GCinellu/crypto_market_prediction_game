require 'rails_helper'


RSpec.describe User, type: :model do
  it "should encode/decode an information into a token" do
    payload = { dummy_value: 'Woosshhh' }

    token  = JsonWebToken.encode(payload)
    decode = JsonWebToken.decode(token)

    expect(decode[:dummy_value]).to eq payload[:dummy_value]
  end
end
