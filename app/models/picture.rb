class Picture < ActiveRecord::Base
	has_attached_file :image, :styles => {
										  :thumb    => ['100x100#',  :jpg, :quality => 70],
										  :preview  => ['480x480#',  :jpg, :quality => 70],
										  :large    => ['600>',      :jpg, :quality => 70],
										  :retina   => ['1200>',     :jpg, :quality => 30]
										}
	
	
end
