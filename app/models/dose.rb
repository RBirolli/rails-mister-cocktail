class Dose < ApplicationRecord
  belongs_to :cocktail
  belongs_to :ingredient
  validates :cocktail_id, presence: true, allow_blank: false
  validates :ingredient_id, presence: true, allow_blank: false
  validates :description, presence: true, allow_blank: false
  validates :cocktail, uniqueness: { scope: :ingredient }
end
