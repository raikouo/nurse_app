class Category < ActiveHash::Base
  self.data = [
    { id: 0, name: '--' },
    { id: 1, name: '必修' },
    { id: 2, name: '一般' },
    { id: 3, name: '状況設定' }
  ]
end
