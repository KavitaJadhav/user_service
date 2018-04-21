class NumberPrinterWorker
  include Sidekiq::Worker

  def perform(*args)
    for i in 1..100
      puts i
    end
  end
end
