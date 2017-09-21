require 'rufus-scheduler'

s = Rufus::Scheduler.singleton

s.every '30s' do
  Thread.new { BtcCoinbasePrices.perform_now }
end

s.every '1m' do
  Thread.new { ProcessPredictionsJob.perform_now }
end
