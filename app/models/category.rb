class Category < ActiveRecord::Base
    validates :id, :presence => true, :uniqueness => true

    has_many :tasks
end
