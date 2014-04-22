require 'sinatra'
require 'sinatra/activerecord'

set :database, "sqlite3:///life_events_app.db"

get "/life_events" do
	@events = LifeEvent.all
	erb :"life_events/index"
end

post "/life_events" do
	@new_event = LifeEvent.new(params[:life_event]) #life_event is table name in db
	@new_event.save
	redirect "/life_events"
end

get '/life_events/:id/edit' do
	@event = LifeEvent.find(params[:id])
	erb :"life_events/edit"
end

get '/life_events/:id/show' do
	@event = LifeEvent.find(params[:id])
	erb :"life_events/show"
end

get "/new" do
	erb :"life_events/new"
end

get "/edit" do
	@events = LifeEvent.all
	erb :"life_events/edit"
end

get "/search" do
	@search_results = LifeEvent.where(params[:id])
	erb :"life_events/search"
end

post "/search" do
	puts params
	@final_results = LifeEvent.where(params[:life_event])
	erb :"life_events/results"
end

put "/life_events/:id" do
	@event_to_update = LifeEvent.find(params[:id])
	@event_to_update.update_attributes(params[:life_event])
	redirect "/life_events"
end

delete '/life_events/:id' do
	delete_record = LifeEvent.find(params[:id])
	if delete_record.delete 
		redirect "/life_events"
	else
		redirect "/life_events/:id"
	end
end

class LifeEvent <ActiveRecord::Base
	def search

	end
end

