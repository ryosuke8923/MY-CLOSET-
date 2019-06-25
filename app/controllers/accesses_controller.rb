class AccessesController < ApplicationController
  before_action :set_access, only:[:show,:tag]
  PER = 12

  def hello
  end

  def goodbye
  end

  def index
  end

  def show
    @ideas = @idea.search(params[:search]).page(params[:page]).per(PER)
  end

  def tag
  end

  private
  def set_access
    user_id = current_hello_user.email
    @idea = Idea.where(user_id: user_id)
  end

end
