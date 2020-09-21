class Zone < ActiveHash::Base
  self.data = [
    { id: 0, name: '--' },
    { id: 1, name: '午前' },
    { id: 2, name: '午後' }
  ]
end