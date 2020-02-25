class Tag < ApplicationRecord
    has_many :taggings
    has_many :articles, through: :taggings
=begin
Or define a new Tag#to_s method
    def to_s
        name
    end
=end

end
