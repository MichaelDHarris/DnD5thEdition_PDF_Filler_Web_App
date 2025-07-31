class Language < ApplicationRecord
  has_many :race_languages
  has_many :races, through: :race_languages

  common = Language.find_or_create_by!(name: "Common")
  elvish = Language.find_or_create_by!(name: "Elvish")
end
