class EventReportsController < ApplicationController
  before_action :set_event_report, only: [:show, :edit, :update, :destroy]

  # GET /event_reports
  def index
    @event_reports = EventReport.all
  end

  # GET /event_reports/1
  def show
  end

  # GET /event_reports/new
  def new
    @event_report = EventReport.new(user_id: params[:user_id], event_id: params[:event_id])
  end

  # GET /event_reports/1/edit
  def edit
  end

  # POST /event_reports
  def create
    @event_report = EventReport.new(event_report_params)

    if @event_report.save
      redirect_to @event_report, notice: 'Event report was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /event_reports/1
  def update
    if @event_report.update(event_report_params)
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
      params.require(:event_report).permit(:user_id, :event_id, :comment)
    end
end
