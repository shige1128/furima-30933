class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'ファッション(レディース)' },
    { id: 4, name: 'ファッション(メンズ)' },
    { id: 5, name: 'ファッション(ベビー・キッズ' },
    { id: 6, name: 'インテリア(雑貨・小物)' },
    { id: 7, name: '本(マンガ・雑誌・小説)' },
    { id: 8, name: '音楽(楽器・CD・楽譜)' },
    { id: 9, name: 'ゲーム(本体・ゲームソフト・周辺機器' },
    { id: 10, name: 'おもちゃ(ホビー・カード)' },
    { id: 11, name: '家電・家具' },
    { id: 12, name: 'スマホ(本体・ケース' },
    { id: 13, name: 'オーディオ(ヘッドホン・イヤホン・スピーカー' },
    { id: 14, name: 'スポーツ(ウェア・道具)' },
    { id: 15, name: '車・バイク(パーツ・アクセサリー)' },
    { id: 16, name: 'ハンドメイド' },
    { id: 17, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :products
end
