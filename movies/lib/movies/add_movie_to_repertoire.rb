# frozen_string_literal: true

module Movie
  class AddMovieToRepertoire < Command
    attribute :movie_id, Types::UUID
    attribute :publisher, Types::Publisher

    alias :aggregate_id :movie
  end
end
