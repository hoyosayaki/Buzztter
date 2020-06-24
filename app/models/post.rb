class Post < ApplicationRecord
    has_one :like
    accepts_nested_attributes_for :like
end
