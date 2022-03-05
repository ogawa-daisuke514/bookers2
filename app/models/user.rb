class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :profile_image
  has_many :books, dependent: :destroy
  validates :name, uniqueness: true, presence: true,
            length: { minimum: 2, maximum: 20}
  validates :introduction, length: { maximum: 50}


  def get_placeholder(prop_name)
    case prop_name
    when :name then
      "(2～20characters, must be present and uniquie)"
    when :introduction then
      "(～50characters)"
    when :email then
      "(must be present and unique)"
    when :password
      "(6～128characters)"
    else
      ""
    end
  end

  def get_introduction_class
    introduction.present? ? "" : "text-secondary font-italic"
  end
  def get_introduction
    introduction.present? ? introduction : "(No introduction)"
  end

  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join("app/assets/images/no_image.jpg")
      profile_image.attach(io: File.open(file_path), filename: "default_image.jpg", content_type: "image/jpeg")
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end
end
