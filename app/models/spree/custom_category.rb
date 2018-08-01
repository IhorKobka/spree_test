module Spree
  class CustomCategory < Spree::Base
    belongs_to :parent,
               -> { order_by_position },
               class_name: 'Spree::CustomCategory',
               foreign_key: 'parent_id',
               optional: true

    has_many :children,
             -> { order_by_position },
             class_name: 'Spree::CustomCategory',
             foreign_key: 'parent_id'

    validates :name, :pos, presence: true
    validates :name, length: { maximum: 50 }
    validates :pos, numericality: { greater_than_or_equal_to: 0 }

    scope :order_by_position, -> { order(:parent_id, :pos) }
    scope :root, -> { where(parent_id: nil).order_by_position }
    scope :children, -> { where.not(parent_id: nil).order_by_position }

    def self.as_tree
      TreeBuilderService.build(root, children)
    end
  end
end

