class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  # after_filter :set_csrf_cookie_for_ng
  # def set_csrf_cookie_for_ng
  #   cookies['XSRF-TOKEN'] = form_authenticity_token if protect_against_forgery?
  # end

  # protected
  #   def verified_request?
  #     super || form_authenticity_token == request.headers['X-XSRF-TOKEN']
  #   end

  private

  # AngularJS automatically sends CSRF token as a header called X-XSRF
  # this makes sure rails gets it
  def verified_request?
    cookies['XSRF-TOKEN'] = form_authenticity_token if protect_against_forgery?
    request.get? ||
      form_authenticity_token == params[request_forgery_protection_token] ||
      form_authenticity_token == request.headers['X-XSRF-Token']
    # Rails.logger.debug 'VERIFICA request_forgery_protection_token=' + params[request_forgery_protection_token].inspect
    # Rails.logger.debug 'VERIFICA request.headers[X-XSRF-Token]=' + request.headers['X-XSRF-Token'].inspect
    # Rails.logger.debug 'VERIFICA form_authenticity_token' + form_authenticity_token.inspect   
  end
 end
