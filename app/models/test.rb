class Test < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :exam
  belongs_to_active_hash :zone
  belongs_to_active_hash :category
  has_one_attached :image
  belongs_to :user
  has_many :studies, dependent: :destroy
  has_many :study_users, through: :studies, source: :user
  has_many :comments, dependent: :destroy

  with_options presence: true do
    validates :question
    validates :choice
  end

  with_options presence: true, numericality: { other_than: 0, message: 'を選択して下さい' } do
    validates :exam_id
    validates :category_id
    validates :zone_id
  end

  with_options presence: true, numericality: { only_integer: true } do
    validates :number
    validates :answer
  end
end
