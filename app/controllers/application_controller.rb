# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def authorize_user!
    if has_access?
      @permition ||= Permition.new(current_user, self.class::ACCESS_ID)

      if %w[new create update destroy destroy_attachment].include?(params[:action])
        unless @permition.can?(params[:action])
          redirect_to (request.referer || root_path), alert: 'Você não tem autorização!'
        end
      end
    end
  end

  def has_access?
    authorize access_menu, :has_access?
  end

  def access_menu
    AccessMenu.new(self.class::ACCESS_ID)
  end

  def user_not_authorized(exception)
    policy_name = exception.policy.class.to_s.underscore

    notice = t "#{policy_name}.#{exception.query}", scope: 'pundit', default: :default

    redirect_to (request.referrer || root_path), alert: notice
  end
end
