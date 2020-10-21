#frozen_string_literal: true
module Movies
  class MovieAddedToRepertoire < Event
    attribute :movie_id, Types::UUID
    attribute :imdb_number, Types::ImdbNumber
    attribute :publisher, Types::Publisher
  end
end
