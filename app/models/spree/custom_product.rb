module Spree
  class CustomProduct < ApplicationRecord
    belongs_to :category, class_name: 'Spree::CustomCategory', foreign_key: 'spree_custom_category_id'

    has_one :catalog_image, as: :viewable, dependent: :destroy, class_name: 'Spree::Image'

    has_many :product_views,
             -> { order(:position) },
             as: :viewable,
             dependent: :destroy,
             class_name: 'Spree::Image'
  end
end