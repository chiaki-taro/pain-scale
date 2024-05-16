class Scale < ActiveHash::Base
  self.data = [
    { id: 0, name: '---' },
    { id: 1, name: '0：痛みがない' },
    { id: 2, name: '1：ほんの少し痛い' },
    { id: 3, name: '2：少し痛い' },
    { id: 4, name: '3：もっと痛い' },
    { id: 5, name: '4：かなり痛い' },
    { id: 6, name: '5：耐えられないくらい痛い' },
  ]

  include ActiveHash::Associations
  has_many :pains
end