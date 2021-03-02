# Stores must always have a name that is a minimum of 3 characters
# Stores have an annual_revenue that is a number (integer) that must be 0 or more
# BONUS: Stores must carry at least one of the men's or women's apparel (hint: use a custom validation method - don't use a Validator class)

class Store < ActiveRecord::Base
  has_many :employees
  validates :name, length: { minimum: 3 }, presence: true
  validates :annual_revenue, numericality: { greater_than: 0 }
  validate :must_have_apparel

  def must_have_apparel
    if !self.mens_apparel && !self.womens_apparel
      errors.add(:mens_apparel, "store must have at least one type of apparel")
      errors.add(:womans_apparel, "store must have at least one type of apparel")
    end
  end

end
