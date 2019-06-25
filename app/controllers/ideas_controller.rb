class IdeasController < ApplicationController
  before_action :set_idea, only: [:show, :edit, :update, :destroy]
  before_action :set_access, only: [:show]
  # GET /ideas
  # GET /ideas.json
  def index
    @ideas = Idea.all
  end

  # GET /ideas/1
  # GET /ideas/1.json
  def show
    @others = @other.search(params[:search])
    @d = @others.where.not(id: @idea.id).where(name: @idea.name).order("RANDOM()").first
    @d1 = @others.where.not(id: @idea.id).where(description: @idea.description).order("RANDOM()").first
  end

  # GET /ideas/new
  def new
    @idea = Idea.new
  end

  # GET /ideas/1/edit
  def edit
  end

  # POST /ideas
  # POST /ideas.json
  def create
    @idea = Idea.new(idea_params)

    respond_to do |format|
      if @idea.save
        format.html { redirect_to @idea, notice: 'Idea was successfully created.' }
        format.json { render :show, status: :created, location: @idea }
      else
        format.html { render :new }
        format.json { render json: @idea.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ideas/1
  # PATCH/PUT /ideas/1.json
  def update
    if @idea.update(idea_params)
    respond_to do |format|
      if @idea.update(idea_params)
        format.html { redirect_to @idea, notice: 'Idea was successfully updated.' }
        format.json { render :show, status: :ok, location: @idea }
      else
        format.html { render :edit }
        format.json { render json: @idea.errors, status: :unprocessable_entity }
      end
     end
    end
  end

  # DELETE /ideas/1
  # DELETE /ideas/1.json
  def destroy
    @idea.destroy
    respond_to do |format|
      user_id = current_hello_user.email
      format.html { redirect_to accesses_show_path(user_id), notice: 'Idea was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_idea
      @idea = Idea.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def idea_params
      params.require(:idea).permit(:name, :description,:user_id,:picture)
    end

    def set_access
      user_id = current_hello_user.email
      @other = Idea.where(user_id: user_id)
    end


end
