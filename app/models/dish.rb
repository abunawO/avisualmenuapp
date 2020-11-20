class Dish < ActiveRecord::Base
  belongs_to :category, optional: true
  default_scope -> { order(created_at: :desc) }
  mount_uploader :picture, PictureUploader #Adding an image to the Item model.
  validates :name,        presence: true, length: { maximum: 200 }
  validates :price,       presence: true, numericality: true
  validates :description, presence: true, length: { maximum: 400 }

  #Adding validations to images.
  validate  :picture_size, if: :picture

  before_save :clean_name

  private

  # Validates the size of an uploaded picture.
  def picture_size
    if picture.size > 5.megabytes
      errors.add(:picture, "should be less than 5MB")
    end
  end

  def clean_name
    self.name = self.name.upcase.strip
    self.description = self.description.capitalize
  end
end
