require 'rails_event_store'
require 'aggregate_root'
require 'arkency/command_bus'

Rails.configuration.to_prepare do
  Rails.configuration.event_store = RailsEventStore::Client.new
  Rails.configuration.command_bus = Arkency::CommandBus.new

  AggregateRoot.configure do |config|
    config.default_event_store = Rails.configuration.event_store
  end

  # Subscribe event handlers below
  Rails.configuration.event_store.tap do |store|
    store.subscribe(Movies::OnMovieAddedToRepertoire, to: [Movies::MovieAddedToRepertoire]) #READ MODEL SUBSCRIBES TO EVENT
    store.subscribe_to_all_events(->(event) { Rails.logger.info(event.type) })
  end

  Rails.configuration.command_bus.tap do |bus|
    bus.register(Movies::AddMovieToRepertoire, Movies::OnMovieAddToRepertoire.new(
      imdb_adapter: OpenStruct.new(fetch_number: "Mocked"))
    )  # ADD COMMAND HANDLER TO THE COMMAND
  end
end
