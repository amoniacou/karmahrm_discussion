class PostComment < Comment
  belongs_to :post, foreign_key: :origin_id
  validates :content, presence: true
end
