class Grade < ActiveHash::Base
  self.data = [
    { id: 1, name: 'B3'}, { id: 2, name: 'B4'}, { id: 3, name: 'M1'},
    { id: 4, name: 'M2'}, { id: 5, name: 'D1'}, { id: 6, name: 'D2'},
    { id: 7, name: 'D3'}
  ]

  include ActiveHash::Associations
  has_many :users
end
