class ThoughtsController < ApplicationController
  before_action :set_thought, only: [:show, :edit, :update, :destroy]

  def index
    @thoughts = Thought.all
  end

  def show
    @observations = @thought.comments.recent
  end

  def new
    @thought = Thought.new
  end

  def edit
  end

  def create
    @thought = Thought.new(thought_params)
    @thought.user = current_user
    respond_to do |format|
      if @thought.save
        format.html { redirect_to @thought, notice: 'Thought was successfully created.' }
        format.json { render :show, status: :created, location: @thought }
      else
        format.html { render :new }
        format.json { render json: @thought.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @thought.update(thought_params)
        format.html { redirect_to @thought, notice: 'Thought was successfully updated.' }
        format.json { render :show, status: :ok, location: @thought }
      else
        format.html { render :edit }
        format.json { render json: @thought.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @thought.destroy
    respond_to do |format|
      format.html { redirect_to thoughts_url, notice: 'Thought was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_thought
      @thought = Thought.find(params[:id])
    end

    def thought_params
      params.require(:thought).permit(:title, :body, :user_id)
    end
end
