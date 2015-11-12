class Place < ActiveRecord::Base
  audited only: [:name, :image, :address]
  validates :name, presence: true

  scope :name_match, -> (s) {where('name like ?', "%#{s}%")}

  mount_uploader :image, PlaceImageUploader
end
