class BSTNode
  attr_accessor :left, :right
  attr_reader :value

  def initialize(value)
    @value = value
    @left = nil
    @right = nil
  end
end

class BinarySearchTree
  def initialize
    @root = nil
  end

  def insert(value)
    if @root.nil?
      @root = BSTNode.new(value)
    else
      BinarySearchTree.insert!(@root, value)
    end
  end

  def find(value)
    BinarySearchTree.find!(@root, value)
  end

  def inorder
    BinarySearchTree.inorder!(@root)
  end

  def postorder
    BinarySearchTree.postorder!(@root)
  end

  def preorder
    BinarySearchTree.preorder!(@root)
  end

  def height
    BinarySearchTree.height!(@root)
  end

  def min
    BinarySearchTree.min(@root)
  end

  def max
    BinarySearchTree.max(@root)
  end

  def delete(value)
    @root = BinarySearchTree.delete!(@root, value)
  end

  def self.insert!(node, value)
    if !node
      return BSTNode.new(value)
    end
    
    if value < node.value 
      node.left = BinarySearchTree.insert!(node.left, value)
    elsif value > node.value 
      node.right = BinarySearchTree.insert!(node.right, value)
    end
    
    node
  end

  def self.find!(node, value)
    if !node
      return nil
    end
    if value == node.value
      return node
    end
    if value < node.value
      BinarySearchTree.find!(node.left, value)
    elsif value > node.value
      BinarySearchTree.find!(node.right, value)
    end

  end

  def self.preorder!(node)
    return [] if !node
    order = []
    order << node.value
    order += BinarySearchTree.inorder!(node.left) if node.left
    order += BinarySearchTree.inorder!(node.right) if node.right
    order
  end

  def self.inorder!(node)
    return [] if !node
    order = []
    order += BinarySearchTree.inorder!(node.left) if node.left
    order << node.value
    order += BinarySearchTree.inorder!(node.right) if node.right
    order
  end

  def self.postorder!(node)
    return [] if !node
    order = []
    order += BinarySearchTree.inorder!(node.left) if node.left
    order += BinarySearchTree.inorder!(node.right) if node.right
    order << node.value
    order
  end

  def self.height!(node)
    return -1 if !node
    
    left = 1 + BinarySearchTree.height!(node.left)
    right = 1 + BinarySearchTree.height!(node.left)
    return [left, right].max
  end

  def self.max(node)
    if !node
      return nil
    end
    
    if node.right.nil?
      node
    end
    
    BinarySearchTree.max(node.right)

  end

  def self.min(node)
    if !node
      return nil
    end
    
    if node.left.nil?
      node
    end
    
    BinarySearchTree.min(node.left)
  end

  def self.delete_min!(node)
    if !node
      return nil
    end
    
    if node.left.nil? && node.right
      return node.right
    end
    
    node.left = BinarySearchTree.delete_min!(node.left)
  end

  def self.delete!(node, value)
    if !node
      return nil
    end
    
    if value < node.value
      BinarySearchTree.delete!(node.left, value)
    elsif value > node.value
      BinarySearchTree.delete!(node.right, value)
    elsif value == node.value 
      if !node.right
        return node.left
      end
      if !node.left
        return node.right
      end
      temp_store = node
      node = BinarySearchTree.min(temp_store.right)
      node.right = BinarySearchTree.delete_min(temp_store.right)
      node.left = temp_store.left
    end
  end
end
