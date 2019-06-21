class Idea < ApplicationRecord
  mount_uploader :picture, PictureUploader

    def self.search(search)
    if search
      where(['name LIKE ? OR description LIKE ?', "%#{search}%", "%#{search}%"])
    else
      all
    end
  end


end
