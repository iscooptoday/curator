class TopicsController < ApplicationController
  before_action :set_topic, only: [:show, :edit, :update, :destroy]

  # need to login before doing anything 
  before_action :authenticate_user!

  
 

def index
   
if  params[:tag]
@topics = Topic.tagged_with(params[:tag]) 
else
@topics = Topic.search_by_welcome_message([:query])

end
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
      @topic = Topic.find_by_description(params[:description])
    end

    
    def topic_params
      params.require(:topic).permit(:description,:author,:user_id,:frequency,:time,:welcome_message,:tag_list,)
    end
end
