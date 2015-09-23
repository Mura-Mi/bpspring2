class EventsController < ApplicationController
  def index
    @events = Event.all
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
    begin
      @event = Event.find(params[:id])
    rescue
      not_found
    else
      respond_to do |format|
        format.html
      end
    end
  end

  def update
    begin
      @event = Event.find(params[:id])
    rescue
      not_found
    else
      if @event.update_attributes(filtered_params)
        respond_to do |format|
          format.html { redirect_to @event }
        end
      else
        respond_to do |format|
          format.html { redirect_to edit_event_path }
        end
      end
    end
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
