class EventReportsController < ApplicationController
  before_action :set_event_report, only: [:show, :edit, :update, :destroy]

  # GET /event_reports
  def index
    render json: EventReport.all, each_serializer: EventReportSerializer
  end

  # GET /event_reports/1
  def show
  end

  # GET /event_reports/new
  def new
    begin
      @event = Event.find(params[:event_id])
    rescue ActiveRecord::RecordNotFound
      @event = nil
    end

    @event_report = EventReport.new(user_id: params[:user_id], event_id: params[:event_id])
  end

  # GET /event_reports/1/edit
  def edit
    @event = @event_report.event
  end

  # POST /event_reports
  def create
    @event_report = EventReport.new(event_report_params)
    @event_report.user = current_user if !@event_report.user

    if @event_report.save
      save_photos
      redirect_to @event_report, notice: 'Event report was successfully created.'
    else
      render :new, params: { user_id: event_report_params[:user_id], event_id: event_report_params[:event_id] }
    end
  end

  # PATCH/PUT /event_reports/1
  def update
    @event = @event_report.event

    if @event_report.update(event_report_params)
      save_photos
      redirect_to @event_report, notice: 'Event report was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /event_reports/1
  def destroy
    @event_report.destroy
    redirect_to event_reports_url, notice: 'Event report was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event_report
      @event_report = EventReport.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def event_report_params
      params.require(:event_report).permit(:user_id,
        :event_id,
        :comment,
        :summary
        # { :event_photos: [] }
        # event_photos_attributes: [:id, :title, :comment, :photo]
      )
    end

    def save_photos
      (params.require(:event_report).permit({ event_photos: [] })[:event_photos] || []).each do |file|
        p = EventPhoto.new(event_report: @event_report);
        p.photo = file
        p.save
      end
    end
end
