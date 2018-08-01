module Spree
  class TreeBuilderService
    attr_reader :tree

    def initialize
      @tree = []
    end

    def self.build(root, children)
      tree = new

      root.each { |object| tree.add_node(object) }
      children.each { |object| tree.add_node(object) }

      tree.tree
    end

    def add_node(object)
      node = new_node(object)

      if object.parent_id
        parent_node = nil

        @tree.each do |n|
          parent_node = find_node(n, object.parent_id)
          break if parent_node
        end
        parent_node ? parent_node[:children] << node : @tree << node
      else
        @tree << node
      end

      node
    end

    def find_node(parent, parent_id)
      return parent if parent[:id] == parent_id
      node = nil

      parent[:children].each do |child|
        node = find_node(child, parent_id)
        break if node.is_a?(Hash)
      end

      node
    end

    private

    def new_node(object)
      node = {
        id: object.id,
        name: object.name,
        pos: object.pos
      }
      node[:children] = []
      node
    end
  end
end