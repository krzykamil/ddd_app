# Bounded Context

module Movies
end

require_dependency 'movies/movie' #aggregate root
require_dependency 'movies/movie_added_to_repertoire' #event
require_dependency 'movies/on_movie_add_to_repertoire' #command handler
require_dependency 'movies/add_movie_to_repertoire' #command itself

