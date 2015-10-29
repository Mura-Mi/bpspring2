class AttendancePlanController < ApplicationController
  def create
    plan = AttendancePlan.new(attendance_plan_params)

    respond_to do |format|
      if plan.save
        format.json { render json: plan }
      end
    end

  end

  def delete
    plan = AttendancePlan.find_by(params[:id])
    plan && plan.destroy
    head :ok
  end

  private
  def attendance_plan_params
    params.require(:attendance_plan) \
      .permit(:user_id, :event_id)
  end

end
