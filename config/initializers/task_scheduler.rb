# Use this file to easily define all of your cron jobs.

# Learn more: http://github.com/jmettraux/rufus-scheduler

require 'rufus-scheduler'
require 'rake'

scheduler = Rufus::Scheduler.new

scheduler.every '24h' do
  Rake::Task['upkeep:prune_alerts']
end
