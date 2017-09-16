require 'rufus-scheduler'

s = Rufus::Scheduler.singleton

s.every '5m' do
  BtcCoinbasePrices.perform_now
end