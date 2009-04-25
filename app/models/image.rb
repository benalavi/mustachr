class Image < ActiveRecord::Base
  is_attachment(
    :storage => :s3,
    :storage_options => {
      :access_key_id => Settings[:s3_access_key_id],
      :secret_access_key => Settings[:s3_secret_access_key],
      :bucket => Settings[:s3_bucket]
    },
    :processors => [ :mustacher, :thumbnail ],
    :recipes => { 
      :mustached => { :mustacher => true },
      :thumbnail => { :mustacher => true, :thumbnail => { :size => '100x100' } },
      :big       => { :mustacher => true, :thumbnail => { :size => '640x480' } },
      :selected  => { :mustacher => true, :thumbnail => { :size => '80x60' } },
      :tiny      => { :mustacher => true, :thumbnail => { :size => '60x45' } }
    }
  )
  
  named_scope :recent, :order => 'created_at DESC'
  named_scope :before, lambda{ |date| 
    { :conditions => [ 'created_at < ?', date ], :order => 'created_at DESC' }
  }
  named_scope :after, lambda{ |date| 
    { :conditions => [ 'created_at > ?', date ], :order => 'created_at ASC' }
  }  
end