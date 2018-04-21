class NumberPrinterWorker
  include Sidekiq::Worker
  sidekiq_options queue: 'priority', :retry => false

  def perform(*args)
    for i in 1..100
      puts i
    end
  end
end
