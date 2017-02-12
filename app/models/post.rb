class Post < ApplicationRecord
    validates :user_id, presence: true
    validates :image, presence: true
    
    has_attached_file :image, styles: { :medium => "640x" }
    # validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
    validates_attachment :image,
    content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }
    
    belongs_to :user
    has_many :comments, dependent: :destroy
    
    validates :caption, presence: true, length: {maximum: 300, minimum: 3}
    
    
end
