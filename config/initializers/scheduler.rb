require 'rufus-scheduler'

s = Rufus::Scheduler.singleton

s.every '30s' do
  BtcCoinbasePrices.perform_now {}
  ProcessPredictionsJob.perform_now {}
end