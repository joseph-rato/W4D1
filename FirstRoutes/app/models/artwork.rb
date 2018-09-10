class Artwork < ApplicationRecord
  validates :title, :artist_id, :image_url, presence: true
  validates :title, uniqueness: { scope: :artist_id,
    message: "Can't use same title twice"
  }
end
