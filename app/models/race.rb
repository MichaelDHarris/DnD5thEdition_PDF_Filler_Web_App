class Race < ApplicationRecord
  has_many :race_languages, dependent: :destroy
  has_many :languages, through: :race_languages

  validates :name, presence: true, uniqueness: true
  validates :speed, presence: true
  validates :ability_bonus, presence: true
end
