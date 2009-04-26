class ImagesController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => :create

  def index
    @images = Image.recent.find :all
  end
  
  def show
    @image = Image.find params[:id]
    @gallery = ImageGallery.new @image
  end

  def new
    @images = Image.recent.find(:all, :limit => 50)
    @image = Image.new
  end

  def create
    @image = Image.new params[:image]
    @image.save!

    respond_to do |format|
      format.html { redirect_to @image }
      format.json { render :json => { :redirect_to => image_path(@image) } }
    end
  end
end
