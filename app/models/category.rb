class Category < ActiveRecord::Base
  belongs_to :menu
  has_many   :dishes, dependent: :destroy

  validates  :name, presence: true, uniqueness: { case_sensitive: false }

  before_save :update_priority



  private

    def update_priority
      self.priority = 0 if self.priority.eql?(nil)
    end
end
