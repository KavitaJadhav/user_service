namespace :workers do
  task :number_printer => :environment do
    NumberPrinterWorker.perform_async
  end
end
