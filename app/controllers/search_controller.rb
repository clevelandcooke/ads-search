class SearchController < ApplicationController

	def new
		@search = Search.new
	end

	def create
    @search_term = params["search"]["search_term"].upcase
    @search_type = search_type
    @recent_events = Event.where("#{@search_type} like '%#{@search_term}%' AND date_of_event IS NOT NULL").order("date_of_event DESC").limit(50)

    respond_to do |f|
      f.js { }
    end
	end

  def show
  end

  def search_type
  	category = params["search_type"]
  	case category
  	when "Filter By...", "Device Name"
  		"generic_name" 
  	when "Manufacturer"
  		"manufacturer_name"
  	when "Description"
  		"mdr_text"
  	end
  end

end
