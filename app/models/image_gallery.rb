class ImageGallery
  attr_reader :before, :after
  
  def initialize(image, size=3)
    @before  = image.class.before(image.created_at).find(:all, :limit => size).reverse
    @before += image.class.find(:all, :limit => (size - @before.size), :order => 'created_at DESC') if @before.size < size
    @after   = image.class.after(image.created_at).find(:all, :limit => size)
    @after  += image.class.find(:all, :limit => (size - @after.size), :order => 'created_at ASC') if @after.size < size
  end
end