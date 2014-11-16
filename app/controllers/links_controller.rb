class LinksController < ApplicationController

  require 'rubygems'
  require 'twilio-ruby'
  
  before_action :set_link, only: [:show, :edit, :update, :destroy]

 
  def index
    @links = Link.all.order("created_at DESC")
  end

    def show
      @link_attachments = @link.link_attachments.all
  end

  def new
    @link = Link.new
    @topic=Topic.all 
    @link_attachment = @link.link_attachments.build
  end
  

  def edit
    @topics = Topic.all
  end


  def create 
    #create the link 
    @link = Link.new(link_params)
    
      if @link.save
        
        params[:link_attachments]['avatar'].each do |a|
          @link_attachment = @link.link_attachments.create!(:avatar => a, :link_id => @link.id)
       end
       redirect_to @link, notice: 'post was successfully submitted.' 
        
     

    # setting up the variables to send text
    account_sid =  "AC810e6bc2b5f92cb7b59025d3269b6997"
    auth_token = "435264bc4f065b988c6dccba3e936b4e"
    client = Twilio::REST::Client.new account_sid, auth_token
    from = "6697211953" # Your Twilio number
    url = link_path(@link)
    sender = @link.topic.description
    
    #only send text if the newsletter got subscribers
   if @link.topic.followers(User) != nil
  
  #send the text    
  @link.topic.followers(User).each do |u| 
  
  #check first if user has a number before sending
  if u.nom
  
  client.account.messages.create(
    :from => from,
    :to => u.nom  ,

    :body => "A new post from #{sender} check it out! http://www.iscoop.co#{url}"
       )
  
  end
  end
    puts "message sent "
    
    end


      else
        render action: 'new' 
        
      end
 end

  
  def update
      
      if current_user.likes?(@link)
        current_user.unlike!(@link)
        redirect_to @link, notice: 'you have unliked this post.'
        else 

      current_user.like!(@link)
       redirect_to @link, notice: 'you have liked this post.'
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
      params.require(:link).permit(:description,:topic_id,:stuff,:url,:url2,:url3,:url4,:url5,link_attachments_attributes: [:id, :link_id, :avatar])
    end

  end
  

