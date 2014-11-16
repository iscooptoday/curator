class LinkAttachmentsController < ApplicationController
  before_action :set_link_attachment, only: [:show, :edit, :update, :destroy]

  # GET /link_attachments
  # GET /link_attachments.json
  def index
    @link_attachments = LinkAttachment.all
  end

  # GET /link_attachments/1
  # GET /link_attachments/1.json
  def show
  end

  # GET /link_attachments/new
  def new
    @link_attachment = LinkAttachment.new
  end

  # GET /link_attachments/1/edit
  def edit
  end

  # POST /link_attachments
  # POST /link_attachments.json
  def create
    @link_attachment = LinkAttachment.new(link_attachment_params)

    respond_to do |format|
      if @link_attachment.save
        format.html { redirect_to @link_attachment, notice: 'Link attachment was successfully created.' }
        format.json { render action: 'show', status: :created, location: @link_attachment }
      else
        format.html { render action: 'new' }
        format.json { render json: @link_attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /link_attachments/1
  # PATCH/PUT /link_attachments/1.json
  def update
    respond_to do |format|
      if @link_attachment.update(link_attachment_params)
        format.html { redirect_to @link_attachment, notice: 'Link attachment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @link_attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /link_attachments/1
  # DELETE /link_attachments/1.json
  def destroy
    @link_attachment.destroy
    respond_to do |format|
      format.html { redirect_to link_attachments_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_link_attachment
      @link_attachment = LinkAttachment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def link_attachment_params
      params.require(:link_attachment).permit(:link_id, :avatar)
    end
end
