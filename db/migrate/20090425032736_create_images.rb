class CreateImages < ActiveRecord::Migration
  def self.up
    create_table :images, :force => true do |t|
      t.string   :filename, :null => false
      t.string   :content_type
      t.integer  :size
      t.datetime :created_at, :null => false
    end
  end

  def self.down
  end
end
