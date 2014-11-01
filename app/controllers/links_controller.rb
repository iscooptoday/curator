class LinksController < ApplicationController

  require 'rubygems'
  require 'twilio-ruby'
  
  before_action :set_link, only: [:show, :edit, :update, :destroy]

 
  def index
    @links = Link.all.order("created_at DESC")
  end

    def show
  end

  def new
    @link = Link.new
    @topic=Topic.all
    
    
  end
  

  def edit
    @topics = Topic.all
  end


  def create 
    #create the link 
    @link = Link.new(link_params)
    
      if @link.save
        redirect_to @link, notice: 'issue was successfully submitted.' 
        
     

    # setting up the variables to send text
    account_sid =  "AC810e6bc2b5f92cb7b59025d3269b6997"
    auth_token = "435264bc4f065b988c6dccba3e936b4e"
    client = Twilio::REST::Client.new account_sid, auth_token
    from = "6697211953" # Your Twilio number
    url = link_path(@link)
    sender = @link.topic.description
    
    
   if @link.topic.followers(User) != nil
   
  #send the text    
  @link.topic.followers(User).each do |u| 
  
  client.account.messages.create(
    :from => from,
    :to => u.nom ,

    :body => "A new issue from #{sender} check it out! http://www.iscoop.co#{url}"
       )
  
  end
    puts "message sent "
    
    


    end

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
      params.require(:link).permit(:description,:topic_id, :url,:url2,:url3,:url4,:url5)
    end

  end
  

