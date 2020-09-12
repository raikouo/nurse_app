(1..3).each do |i|
  (1..20).each do |j|
    Test.create(
      user_id:1,
      exam_id:i,
      number:j,
      question: "#{j}番目の問題です！",
      choice: "選択肢1
選択肢2
選択肢3
選択肢4",
      answer:rand(1..4),
      category_id: rand(1..9)
    )
  end
end