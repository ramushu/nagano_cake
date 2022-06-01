class Item < ApplicationRecord
  has_one_attached :item_image
  belongs_to :genre
  has_many :cart_items, dependent: :destroy
  has_many :order_details

  validates :name, presence: true, uniqueness: true
  validates :introduction, presence: true
  validates :price, presence: true
  # validates :genre_id, exclusion: { in: [""] }
  validates :is_active, inclusion: {in: [true, false]}

  def get_image
    unless item_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      item_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    item_image
  end
  
  # def taxin_price
  #   price*1.1
  # end
  
  def taxin_price
    price * 1.1.round
  end

end
