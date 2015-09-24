require 'spec_helper'

module ControllerMacros
  public
  def login_user
    allow(controller).to receive(:authenticate_user!).and_return(true)
    @request.env["devise.mapping"] = Devise.mappings[:user]
    sign_in FactoryGirl.create(:user, name: 'sample user name', 
                               password: 'hogehoge', password_confirmation: 'hogehoge',
                               email: 'stub@example.com'
                              )
  end
end
