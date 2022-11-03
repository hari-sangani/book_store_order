class CartCleanupJob < ApplicationJob
  queue_as :default

  def perform(*_args)
    puts 'Carts has been cleaned.!!'
  end
end
