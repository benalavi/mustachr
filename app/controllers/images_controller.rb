class ImagesController < ApplicationController
  GALLERY_WIDTH = 3

  skip_before_filter :verify_authenticity_token, :only => :create

  def index
    @images = Image.recent.find :all
  end
  
  def show
    @image   = Image.find params[:id]
    @before  = Image.before(@image.created_at).find(:all, :limit => GALLERY_WIDTH).reverse
    @before += Image.find(:all, :limit => (GALLERY_WIDTH - @before.size), :order => 'created_at DESC') if @before.size < GALLERY_WIDTH
    @after   = Image.after(@image.created_at).find(:all, :limit => GALLERY_WIDTH)
    @after  += Image.find(:all, :limit => (GALLERY_WIDTH - @after.size), :order => 'created_at ASC') if @after.size < GALLERY_WIDTH
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
