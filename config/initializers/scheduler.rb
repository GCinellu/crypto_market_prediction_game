require 'rufus-scheduler'

s = Rufus::Scheduler.singleton

s.every '1s' do
  BtcCoinbasePrices.perform_now
end