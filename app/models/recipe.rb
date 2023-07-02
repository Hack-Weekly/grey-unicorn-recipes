class Recipe < ApplicationRecord
  has_rich_text :body
  has_one_attached :image, dependent: :destroy

  has_many :ingredients
  belongs_to :author, class_name: "User", foreign_key: "author_id"

  accepts_nested_attributes_for :ingredients, reject_if: :all_blank

  validates :title, :instructions, presence: true
end
