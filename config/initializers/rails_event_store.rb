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
    # store.subscribe(Movies::OnMovieAddedToRepertoire, to: [Movies::MovieAddedToRepertoire]) #READ MODEL SUBSCRIBES TO EVENT
    #I added Event part cause it was too similair to command handler (made -> make) at this stage I still need it to make it easier to different classes
    store.subscribe(Sales::OnSaleMadeEvent, to: [Sales::SaleMade])
    store.subscribe(Products::OnSaleMadeEvent, to: [Sales::SaleMade])
    store.subscribe(Commissions::OnSaleMadeEvent, to: [Sales::SaleMade])
    store.subscribe(Commissions::OnCommissionsApplied, to: [Commissions::CommissionsApplied])
    #Note that more than 1 read models subscribe to the same event
    store.subscribe_to_all_events(->(event) { Rails.logger.info(event.event_type) })
  end

  Rails.configuration.command_bus.tap do |bus|
    # ADD COMMAND HANDLERs TO THE COMMANDs
    # bus.register(Movies::AddMovieToRepertoire, Movies::OnMovieAddToRepertoire.new(imdb_adapter: OpenStruct.new(fetch_number: "Mocked")))
    bus.register(Sales::MakeSale, Sales::OnSaleMake.new)
    bus.register(Commissions::DistributeSaleCommissions, Commissions::OnDistributeSaleCommissions.new)
  end
end
