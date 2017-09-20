require 'rufus-scheduler'

s = Rufus::Scheduler.singleton

s.every '30s' do
  BtcCoinbasePrices.perform_now
end

s.every '1m' do
  ProcessPredictionsJob.perform_now
end
