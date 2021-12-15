require 'faker'

def setup_environment
  Rails.env == 'production' ? 'production' : 'development'
end

environment = setup_environment

Dir[File.join(Rails.root, 'db', 'seeds', environment, '*.rb')].sort.each do |seed|
  puts "Loading seed in env #{environment} | #{File.basename(seed, '.rb')}"
  load seed
end