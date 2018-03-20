class Article < ApplicationRecord

has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

# validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

has_many :comments, dependent: :destroy
accepts_nested_attributes_for :comments, allow_destroy: true, reject_if: :all_blank

validates :title, presence: true,
                    length: { minimum: 5 }
validates :text, presence: true
#accepts_nested_attributes_for :comments,
 #                              allow_destroy: true,
                               #reject_if: proc (|att| att['description'].black) 
#belongs_to :article

belongs_to :user


end
