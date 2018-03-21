class Comment < ApplicationRecord
  belongs_to :article, touch: true
  after_touch do
    puts 'An Employee was touched'
  end
end  
