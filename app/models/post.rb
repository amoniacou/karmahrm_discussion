class Post < ActiveRecord::Base
  # Associations
  belongs_to :user
  belongs_to :topic
  belongs_to :parent, class_name: 'Post', foreign_key: :reply_to_id
  has_many :replies, class_name: 'Post',
                     foreign_key: 'reply_to_id',
                     dependent: :nullify
  has_many :comments, class_name: 'PostComment', as: :origin
  # Validations
  validates :title, presence: true
  validates :content, presence: true
  validates :user_id, presence: true
  # Scopes
  scope :approved, -> { where(state: 'approved') }
  scope :pending_review, -> { where(state: 'pending_review') }
  scope :spam, -> { where(state: 'spam') }
  # acts as
  acts_as_taggable # Alias for acts_as_taggable_on :tags
  markable_as :favorite
  searchkick if KarmaHrm.search_kick_enabled?
  # acts_as_taggable_on :tags
  if ActsAsPluggable::Plugin.find_by_id(:karmahrm_feed)
    include PublicActivity::Model
    # tracked
    tracked owner: proc { |controller, _model| controller.current_user }
  end
  # Methods
  def approved?
    state == 'approved'
  end

  def approve
    update(state: 'approved')
  end

  def mark_as_spam
    update(state: 'spam')
  end

  def comments_count
    comments.count
  end
end
