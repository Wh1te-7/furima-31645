FactoryBot.define do
  factory :user do
    last_name {"武雄"}
    first_name {"フリマ"}
    last_name_kana {"タケオ"}
    first_name_kana {"フリマ"}
    nickname {"フリマ武雄"}
    birthday {Faker::Date.birthday(min_age: 18, max_age: 65)}
    password {"test002"}
    password_confirmation {"test002"}
    email {Faker::Internet.free_email}
  end
end

# FactoryBotの記述をしていく
# →マイグレーションファイルの記述を確認しながら記入していきましょう
# →バリデーションに引っかからないようにしましょう