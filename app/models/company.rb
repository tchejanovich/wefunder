class Company < ApplicationRecord
    validates :name, presence: true
    has_many :pitch_deck_images 
end
