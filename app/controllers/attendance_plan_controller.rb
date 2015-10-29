class AttendancePlanController < ApplicationController
  before_action :authenticate_user!

  def create
    plan = AttendancePlan.new(attendance_plan_params)

    respond_to do |format|
      if plan.save
        format.js
      end
    end

  end

  def delete
    input = attendance_plan_params
    plan = AttendancePlan.of(input[:user_id], input[:event_id])
    plan && plan.each { |p| p.destroy }

    respond_to do |format|
      format.js
    end
  end

  private
  def attendance_plan_params
    params.require(:attendance_plan) \
      .permit(:user_id, :event_id)
  end

end
