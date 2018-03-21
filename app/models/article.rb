class Article < ApplicationRecord

has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

# validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

has_many :comments, dependent: :destroy
accepts_nested_attributes_for :comments, allow_destroy: true, reject_if: :all_blank

validates :title, presence: true,
                    length: { minimum: 5 }
validates :title, uniqueness:  { :scope => :user_id }
validates :text, presence: true,
             length: { maximum: 10 }
validates :subtitle, inclusion: {in: %w(small medium large),
           message: "%{value} is not a valid subtitle." }
#accepts_nested_attributes_for :comments,
 #                              allow_destroy: true,
                               #reject_if: proc (|att| att['description'].black) 
#belongs_to :article

belongs_to :user
 validates_acceptance_of :terms_of_service

validates :title, exclusion: { in: %w(bitch dog),
    message: "%{value} Do not use abusing lang." }  

 validates :title, format: { with: /\A[a-zA-Z]+\z/,
    message: "only allows letters" }

    after_touch :log_when_employees_or_company_touched
 
  private
  def log_when_employees_or_company_touched
    puts 'Employee/Company was touched'
  end

end
