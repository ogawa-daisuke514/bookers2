class Book < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :body, presence: true

  def get_placeholder(prop_name)
    case prop_name
    when :title then
      "(required)"
    when :body then
      "(required)"
    end
  end
end
