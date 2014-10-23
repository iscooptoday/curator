class LinksController < ApplicationController

  require 'rubygems'
  require 'twilio-ruby'
  
  before_action :set_link, only: [:show, :edit, :update, :destroy]

  # need to login before doing anything 
  before_action :authenticate_user!

 
  def index
    @links = Link.all.order("created_at DESC")
  end

    def show
  end

  def new
    @link = Link.new
    @topics = Topic.all
    
  end
  

  def edit
    @topics = Topic.all
  end


  def create
    
    
    #create the link 
    @link = Link.new(link_params)


 # then do the twilio thing
    account_sid =  "AC810e6bc2b5f92cb7b59025d3269b6997"
    auth_token = "435264bc4f065b988c6dccba3e936b4e"
    client = Twilio::REST::Client.new account_sid, auth_token
    from = "6697211953" # Your Twilio number
      
  @link.topic.followers(User).each do |u| 
      
  client.account.messages.create(
    :from => from,
    :to => u.nom,
    :body => request.referer
   )
    puts "Sent message "
    end






    
      if @link.save
        redirect_to @link, notice: 'issue was successfully submitted.' 
        
      else
        render action: 'new' 
        
      end
    end

  
  def update
    
      if @link.update(link_params)
        redirect_to @link, notice: 'issue was successfully updated.' 
      
      else
        render action: 'edit' 
        
      end
    end

  
  def destroy
    @link.destroy
      redirect_to links_url 
  end

  private
    
    def set_link
      @link = Link.find(params[:id])
    end

    
    def link_params
      params.require(:link).permit(:description, :topic_id,:stuff)
    end
end
