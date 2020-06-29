class TopicsController < ApplicationController
  before_action :set_topic, only: [:show, :edit, :update, :destroy]

  # GET /topics
  # GET /topics.json
  def index
  @topics = Topic.all
  @newTopic = Topic.new
  @search = Topic.ransack(params[:q])
  @topics = @search.result
  end

  # GET /topics/1
  # GET /topics/1.json
  def show
  @topic = Topic.find(params[:id])
  @newpost = Post.new(:topic_id => params[:id])
  @posts = Post.where(topic_id: params[:id])
  end

  # GET /topics/new
  def new
    @topic = Topic.new
  end

  # GET /topics/1/edit
  def edit
  end





  # POST /topics
  # POST /topics.json
  def create
   @topic = Topic.new(params[:topic].permit(:title))
  @topic.save
  redirect_to topics_path
end

  # PATCH/PUT /topics/1
  # PATCH/PUT /topics/1.json
  def update
    respond_to do |format|
      if @topic.update(topic_params)
        format.html { redirect_to @topic, notice: 'Topic was successfully updated.' }
        format.json { render :show, status: :ok, location: @topic }
      else
        format.html { render :edit }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /topics/1
  # DELETE /topics/1.json
  def destroy
    @topic.destroy
    respond_to do |format|
      format.html { redirect_to topics_url, notice: 'Topic was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_topic
      @topic = Topic.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def topic_params
      params.fetch(:topic, {})
    end


  def topic_params
    params.require(:topic).permit(:tag_list) 
    
  end



end
