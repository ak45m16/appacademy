require_relative 'graph'

# Implementing topological sort using both Khan's and Tarian's algorithms

def topological_sort(vertices)
  sorted = []
  queue = []
  
  vertices.each do |vertex|
    if vertex.in_edges.empty?
      queue.push(vertex)
    end
  end
  
  until queue.empty?
    current = queue.shift
    sorted << current
    current.out_edges.each do |edge|
      if edge.to_vertex.in_edges.empty?
        queue.push(edge.to_vertex)
      end
      edge.destroy!
    end
    vertices.delete_if { |vert| vert.value == current.value }
  end
  
  sorted
end
