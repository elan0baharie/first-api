class Quote < ApplicationRecord
  validates :author, presence: true
  validates :content, presence: true
  # validates :content, uniqueness: true
  has_many :comments
  scope :search, -> (name_parameter) { where("lower(author) like ?", "%#{name_parameter.downcase}%")}

end
