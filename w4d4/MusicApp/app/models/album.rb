class Album < ApplicationRecord
  validates :band_id, :name, :album_type, presence: true
  validates :album_type, inclusion: %w(live studio)

  belongs_to :band,
    primary_key: :id,
    foreign_key: :band_id,
    class_name: :Band

  has_many :tracks,
    primary_key: :id,
    foreign_key: :album_id,
    class_name: :Track,
    dependent: :destroy
end
