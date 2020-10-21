require 'aggregate_root'

module Movies
  class Movie
    include AggregateRoot

    AlreadyInRepertoire = Class.new(StandardError)
    MovieOutdated = Class.new(StandardError)
    MissingPublisher = Class.new(StandardError)

    def initialize(id)
      @id = id
      @state = :draft
      @tickets = []
    end

    def add_to_repertoire(imdb_id, publisher)
      raise AlreadyInRepertoire if @state == :in_repertoire
      raise MovieOutdated if @state == :outdated
      raise MissingPublisher unless publisher
      apply MovieAddedToRepertoire.new(data: {movie_id: @id, imdb_id: imdb_id, publisher: publisher})
    end

    on MovieAddedToRepertoire do |event|
      @publisher_id = event.data[:publisher_id]
      @imdb_id = event.data[:imdb_id]
      @state = :in_repertoire
    end

    private
  end
end
