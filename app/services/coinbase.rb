class Coinbase
  def initialize(args = {})
    @host = 'https://api.coinbase.com/'
    @path = 'v2/prices/BTC-EUR'

    @api_methods = ['sell', 'buy', 'spot']
  end

  def prices
    {
        buy: amount_float('buy'),
        sell: amount_float('sell'),
        spot: amount_float('spot')
    }
  end

  private

  def fetch_price method
    return "Method not allowed" unless @api_methods.include?(method)

    response = RestClient.get("#{@host}/#{@path}/#{method}")
    JSON.parse(response.body)
  end

  def amount(method)
    fetch_price(method)['data']['amount']
  end

  def amount_float(method)
    amount(method).to_f
  end
end