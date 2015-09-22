class EventsController < ApplicationController
  def index
  end

  def show
    begin
      @event = Event.find(params[:id]);
    rescue ActiveRecord::RecordNotFound
      not_found
    else
      respond_to do |format|
        format.html
      end
    end

  end

  def create
  end
end
