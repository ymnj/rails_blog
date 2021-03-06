class Comment < ActiveRecord::Base

	# Comments belong to a post
	belongs_to :post
  belongs_to :user

  scope :order_asc, -> {order("created_at ASC")}  



	# The scope will make sure that only unique comment body per post
	validates :body, presence: true,
					 uniqueness: { scope: :post_id, message: "This comment has already been posted" }

end
