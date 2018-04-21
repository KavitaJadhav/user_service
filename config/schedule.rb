env :PATH, ENV['PATH']
set :environment, 'development'

every 1.hour do
  puts 'Print numbers from 1 to 100'
  rake 'workers:number_printer'
end
