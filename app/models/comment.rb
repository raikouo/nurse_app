class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :test

  with_options presence: true do
    validates :text, length: { maximum: 400 }
    validates :user_id
    validates :test_id
  end

end
