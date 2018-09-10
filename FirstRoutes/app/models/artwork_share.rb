# == Schema Information
#
# Table name: artwork_shares
#
#  id         :bigint(8)        not null, primary key
#  artwork_id :integer          not null
#  viewer_id  :integer          not null
#

class ArtworkShare < ApplicationRecord
  validates :viewer_id, :artwork_id, presence: true
  validates :artwork_id, uniqueness: { scope: :viewer_id,
    message: "Can't share same art to same user twice."
  }

  belongs_to :artwork,
    primary_key: :id,
    foreign_key: :artwork_id,
    class_name: :Artwork

  belongs_to :viewers,
    primary_key: :id,
    foreign_key: :viewer_id,
    class_name: :User
end
