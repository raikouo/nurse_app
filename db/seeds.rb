(1..3).each do |i|
  (1..20).each do |j|
    Test.create(
      time:"10#{i}",
      number:j,
      question: "#{j}番目の問題です！",
      choice:
      "選択肢1\r選択肢2\r選択肢3\r選択肢4",
      answer:rand(1..4),
      category: "カテゴリ#{rand(1..5)}"
    )
  end
end