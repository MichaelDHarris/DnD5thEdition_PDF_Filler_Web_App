# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# First, clear everything
Race.destroy_all
Language.destroy_all

# Then create languages
common = Language.find_or_create_by!(name: "Common")
elvish = Language.find_or_create_by!(name: "Elvish")

# Now create races and assign languages
elf = Race.create!(name: "Elf", speed: 30, ability_bonus: "+2 DEX")
elf.languages << [common, elvish]

dwarf = Race.create!(name: "Dwarf", speed: 25, ability_bonus: "+2 CON")
dwarf.languages << [common]

human = Race.create!(name: "Human", speed: 30, ability_bonus: "+1 All")
human.languages << [common]

halfling = Race.create!(name: "Halfling", speed: 25, ability_bonus: "+2 DEX")
halfling.languages << [common]
