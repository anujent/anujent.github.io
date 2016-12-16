class Photo < ActiveRecord::Base
	has_attached_file :image ,
                    :url => "/file/:id/:style_:basename.:extension",
                  styles: { thumb: ["64x64#", :jpg]}
	validates_attachment :image,
                     content_type: { content_type: ["image/jpeg", "image/gif", "image/png", "video/mp4", "video/avi"] }

    # has_attached_file :image,
    #               styles: { thumb: ["64x64#", :jpg] }
end
