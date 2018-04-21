class EvenNumberPrinterJob < ApplicationJob
  queue_as :default

  def perform(*args)
    for i in 1..100
      puts i if i%2==0
    end
  end
end
