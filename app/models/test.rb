class Test < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :exam
  belongs_to_active_hash :category
  has_one_attached :image

  with_options presence: true do
    validates :question
    validates :choice
  end

  with_options numericality: { other_than: 0 } do
    validates :exam_id, presence: true
    validates :category_id
  end

  with_options presence: true, numericality: { only_integer: true } do
    validates :number
    validates :answer
  end
end
