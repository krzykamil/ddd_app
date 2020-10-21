# frozen_string_literal: true

module Movies
  class OnMovieAddedToRepertoire
    def call(event)
      movie = Movie.find_by(uid: event.data[:movie_id])
      movie.number = event.data[:movie_number]
      movie.customer = Publisher.find(event.data[:publisher]).name
      movie.state = "in_repertoir"
      movie.save!
    end
  end
end
