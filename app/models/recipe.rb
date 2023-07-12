class Recipe < ApplicationRecord
  has_rich_text :instructions
  has_many_attached :images, dependent: :destroy

  has_many :ingredients
  belongs_to :author, class_name: "User", inverse_of: :recipes

  accepts_nested_attributes_for :ingredients, reject_if: :all_blank

  validates :title, :instructions, presence: true

  scope :public_recipes, -> { where(public: true) }
end
