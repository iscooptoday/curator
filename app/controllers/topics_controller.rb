class TopicsController < ApplicationController
  before_action :set_topic, only: [:show, :edit, :update, :destroy]

  # need to login before doing anything 
  before_action :authenticate_user!
 
  
  def index
    @topics = Topic.all
  end

  def show
  end

  def new
    @topic = current_user.topics.build
  end

  
  def edit
    
  end

  
  def create
    @topic = current_user.topics.build(topic_params)

      if @topic.save
        redirect_to @topic, notice: 'Topic was successfully created.' 
        else
        render action: 'new' 
      end
    end

  
  def update
      
      if current_user.follows?(@topic)
        current_user.unfollow!(@topic)
        redirect_to @topic, notice: 'you are no longer following this newsletter.'
        else 

      current_user.follow!(@topic)
       redirect_to @topic, notice: 'you are now following this newsletter.'
  end
  end

  
  def destroy
    @topic.destroy
      redirect_to topics_url 
    end

  private
    
    def set_topic
      @topic = Topic.find(params[:id])
    end

    
    def topic_params
      params.require(:topic).permit(:description,:author,:frequency,:time,:welcome_message)
    end
end
