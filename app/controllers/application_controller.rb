class ApplicationController < ActionController::API
  rescue_from ActionController::ParameterMissing, with: :missing_user_parameter

  def render_json(data, status = :ok)
    render json: data, status: status
  end

  def authenticate_user
    @current_user = User.find_by(authentication_token: request.headers['Authorization'])
    unless @current_user
      render_json({ error: 'Unauthorized' }, :unauthorized)
    end
  end

  def is_admin
    if @current_user&.user_type == UserConstants::ADMIN_TYPE
      true
    else
      render_json({ error: 'Unauthorized, The Seeker cannot access this API' }, :unauthorized)
      false
    end
  end

  def is_seeker
    if @current_user&.user_type == UserConstants::SEEKER_TYPE
      true
    else
      render_json({ error: 'Unauthorized, The Seeker cannot access this API' }, :unauthorized)
      false
    end

  end

  def current_user
    @current_user
  end

  def missing_user_parameter
    render_json({ error: 'User parameter is missing or empty' }, :bad_request)
  end

end
