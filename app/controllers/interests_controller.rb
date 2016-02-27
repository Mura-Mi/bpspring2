class InterestsController < ApplicationController
  before_action :authenticate_user!
  before_action :initialize_service

  def create
    p = interest_params
    @interest = @service.register_interest(p['to_type'], p['to_id'], p['interest_type'])

    render json: Interest.where(to_type: p['to_type'], to_id: p['to_id']).group(:interest_type).count
  end

  private
    def interest_params
      params.require(:interest).permit(
        :to_type,
        :to_id,
        :interest_type
      );
    end

    def initialize_service
      @service = InterestService.new(current_user)
    end

end
