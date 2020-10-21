# frozen_string_literal: true

module Movies
  class OnMovieAddToRepertoire
    include CommandHandler

    def initialize(imdb_adapter:)
      @imdb_adapter = imdb_adapter
    end

    def call(command)
      with_aggregate(Movie, command.aggregate_id) do |order|
        imdb_number = imdb_adapter.fetch_number
        order.submit(imdb_number, command.customer_id)
      end
    end

    private

    attr_accessor :imdb_adapter
  end
end
