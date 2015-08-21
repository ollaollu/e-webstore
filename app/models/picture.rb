class Picture < ActiveRecord::Base
	has_attached_file :image, :styles => {
										  :thumb    => ['100x100#',  :jpg, :quality => 70],
										  :preview  => ['480x480#',  :jpg, :quality => 70],
										  :large    => ['600>',      :jpg, :quality => 70],
										  :retina   => ['1200>',     :jpg, :quality => 30]
										}

	validates_attachment :image,
					    :presence => true,
					    :size => { :in => 0..5.megabytes },
					    :content_type => { content_type: ["image/jpg", "image/jpeg", "image/png"] }										
	
	
end
