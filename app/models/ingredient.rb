class Ingredient < ApplicationRecord
  has_many :doses
  validates :name, uniqueness: true, presence: true, allow_blank: false

  before_destroy :doses_with_ingedients?

private

  def doses_with_ingedients?
    if doses.count == 0
      errors.add(:base, "Cannot delete ingredient with doses")
    else
      ingredient.destroy
    end
  end
end
