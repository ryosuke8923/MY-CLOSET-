class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def after_sign_in_path_for(resource)
    accesses_index_url
  end

  def after_sign_out_path_for(resource)
    accesses_goodbye_url
  end


end
