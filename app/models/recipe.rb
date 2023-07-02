class Recipe < ApplicationRecord
  has_rich_text :body
  belongs_to :author, class_name: "User", foreign_key: "author_id"
  validates :title, :instructions, presence: true
end
