class Article < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, uniqueness: true
  validates :body , presence: true, length: {minimum: 20}

  before_create :initialize_visit_count, only: [:create]


  def update_visit_count
    self.update(visits_count: self.visits_count + 1)
  end

  private

  def initialize_visit_count
    self.visits_count = 0
  end

end
