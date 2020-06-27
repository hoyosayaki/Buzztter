class Post < ApplicationRecord
    has_one :like
    belongs_to :user
    accepts_nested_attributes_for :like
end
