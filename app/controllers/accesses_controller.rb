class AccessesController < ApplicationController
  before_action :set_access, only:[:show]


  def hello
  end

  def goodbye
  end

  def index
  end

  def show
    user_id = current_hello_user.email
    @idea = Idea.where(user_id: user_id)
    @ideas = @idea.search(params[:search])
  end


  private
  def set_access
  end

end
