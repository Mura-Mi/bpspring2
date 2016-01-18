class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # You should also create an action method in this controller like this:
  def twitter
    auth_info = request.env['omniauth.auth']
    profile = SnsProfile.find_by(provider: auth_info['provider'], uid: auth_info['uid'])

    sign_up = !user_signed_in?

    unless profile
      profile = SnsProfile.new(
        provider: auth_info['provider'],
        uid: auth_info['uid'],
        nickname: auth_info['info']['nickname'])

      user = current_user || User.new(name: auth_info['info']['name'])
      profile.user = user
      user.sns_profile.push profile
      profile.save
      user.save
    else
      user = profile.user
    end

    sign_in(:user, user) unless current_user
    redirect_to sign_up ? '/users/edit' : root_path ;
  end

  def facebook
    auth_info = request.env['omniauth.auth']
    profile = SnsProfile.find_by(provider: auth_info['provider'], uid: auth_info['uid'])

    sign_up = !user_signed_in?

    unless profile
      profile = SnsProfile.new(
        provider: auth_info['provider'],
        uid: auth_info['uid'],
        nickname: auth_info['info']['name'])

      user = current_user || User.new(name: auth_info['info']['name'])
      profile.user = user
      user.sns_profile.push profile
      profile.save
      user.save
    else
      user = profile.user
    end

    sign_in(:user, user) unless current_user
    redirect_to sign_up ? '/users/edit' : root_path ;
  end

  # GET|POST /resource/auth/twitter
  def passthru
   super
  end

end
