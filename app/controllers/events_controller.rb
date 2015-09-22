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

  def new
    @event = Event.new
    respond_to do |format|
      format.html
    end
  end

  def create
    @event = Event.new(filtered_params);
    if @event.save
      respond_to do |format|
        format.html { redirect_to @event }
      end
    else 
      respond_to do |format|
        format.html { render action: 'new' }
      end
    end
  end

  def edit

  end

  def update

  end

  private 
    def filtered_params 
      params.require(:event).permit(
        :name,
        :event_date,
        :comment,
        :place_id
      )
    end

end
