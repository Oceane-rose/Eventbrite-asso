class EventsController < ApplicationController
	
	def create
    @events = Event.new('title' => params[:title], 'description' => params[:description])
	end
	
	def index
		@events = Event.all
	end

	def secret

	end

end
