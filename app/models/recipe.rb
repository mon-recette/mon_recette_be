class Recipe < ApplicationRecord
  belongs_to :user

  validates_presence_of :instructions
  validates_presence_of :ingredients
  validates_presence_of :name
end