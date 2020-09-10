class Test < ApplicationRecord
  serialize :choice #配列で保存

  with_options presence: true do
    validates :question
    validates :choice
  end

  with_options presence: true, numericality: { only_integer: true } do
    validates :time
    validates :number
    validates :answer
  end
end
