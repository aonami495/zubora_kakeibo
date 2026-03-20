
def create_category_with_keywords(name, words)
  category = Category.create(name: name)
  words.each do |w|
    category.keywords.create(word: w)
  end
end



CATEGORIES = {
  "食費" => [ "朝食", "昼食", "夕食", "間食", "スーパー", "コンビニ" ],
  "交通費" => [ "電車", "駐輪場", "バス", "駐車場" ],
  "娯楽費" => [ "ゲーム", "カラオケ", "漫画", "小説" ],
  "サブスク" => [ "ジム", "AI", "アマゾン", "動画" ],
  "医療費" => [ "病院", "薬" ],
  "教育費" => [ "文房具", "本", "教科書" ],
  "その他" => []
}

CATEGORIES.each do |name, words|
  create_category_with_keywords(name, words)
end
