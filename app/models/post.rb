class Post < ApplicationRecord
    validates_presence_of :content
    has_and_belongs_to_many :tags
end
