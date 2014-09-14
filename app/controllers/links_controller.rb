class LinksController < ApplicationController
  before_action :set_link, only: [:show, :edit, :update, :destroy]

  # need to login before doing anything 
  before_action :authenticate_user!

 
  def index
    @links = Link.all
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
    @link = Link.new(link_params)

    
      if @link.save
        redirect_to @link, notice: 'Link was successfully created.' 
        
      else
        render action: 'new' 
        
      end
    end

  
  def update
    
      if @link.update(link_params)
        redirect_to @link, notice: 'Link was successfully updated.' 
      
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
      params.require(:link).permit(:description, :url,:url2,:url3,:url4,:url5, :topic_id)
    end
end
