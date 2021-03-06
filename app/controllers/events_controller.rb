require 'calendar/year_month'

class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]

  def index
    @events = Event.all
    @events = @events.name_match(params[:search]) if params[:search].present?

    if params[:month] && /\d{4}-?\d{2}/ =~ params[:month]
      @yearMonth = YearMonth.new(params[:month][0, 4].to_i, params[:month][-2, 2].to_i)
    else
      @yearMonth = YearMonth.today
    end

    @cal = EventCalendar.new(@yearMonth, @events)

    respond_to do |format|
      format.html
      format.json {
        @events = @events.sort_by { |e| e.offset_days }
        render json: @events, each_serializer: EventSerializer
      }
    end

  end

  def show
    begin
      @event = Event.find(params[:id])
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
    @event = Event.new(filtered_params)
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
        render :edit
      end
    end
  end

  private

    def filtered_params
      params.require(:event)
        .permit(
          :name,
          :abbreviation,
          :event_date,
          :comment,
          :place_id
        )
    end
end
