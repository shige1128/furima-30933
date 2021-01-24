class Status < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '新品、未使用' },
    { id: 3, name: '未使用に近い' },
    { id: 4, name: '目立った傷や汚れなし' },
    { id: 5, name: 'やや傷や汚れあり' },
    { id: 6, name: '傷や汚れが目立つ' },
    { id: 7, name: '全体的に状態が悪い' },
    { id: 8, name: 'ジャンク品' },
    { id: 9, name: 'ボロッボロ' }
  ]

  include ActiveHash::Associations
  has_many :products
end
