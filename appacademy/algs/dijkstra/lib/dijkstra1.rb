require_relative 'graph'
require 'byebug'

# O(|V|**2 + |E|).
def dijkstra1(source)
  possible_paths = Hash.new(Float::INFINITY)
  shortest_paths = { source => { :cost => 0, :last_edge => nil }}
  possible_paths[source] = 0
  until possible_paths.empty?
    v,c = possible_paths.min_by(&:last)
    possible_paths.delete(v)
    shortest_paths[v] = { :cost => c, :last_edge => nil }
    v.out_edges.each do |edge|
      v2, c2 = edge.to_vertex, edge.cost
      total_cost = c + c2
      possible_paths[v2] = [possible_paths[v2], total_cost].min
    end
  end
  shortest_paths
end
