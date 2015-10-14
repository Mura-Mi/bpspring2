class HomeController < ApplicationController
  def index
    if !current_user
      redirect_to controller: :top_page, action: :index
    end
  end
end
