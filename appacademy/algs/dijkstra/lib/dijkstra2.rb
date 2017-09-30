require_relative 'graph'
require_relative 'priority_map'
require 'byebug'

# O(|V| + |E|*log(|V|)).
def dijkstra2(source)
  possible_paths = PriorityMap.new { |value1, value2| value1[:cost] <=> value2[:cost] }
  shortest_paths = { source => { :cost => 0, :last_edge => nil }}
  possible_paths[source] = { cost: 0, last_edge: nil }
  until possible_paths.empty?
    v1,c1 = possible_paths.extract
    shortest_paths[v1] = c1
    
    v1.out_edges.each do |edge|
      v2, c2 = edge.to_vertex, edge.cost
      total_cost = shortest_paths[v1][:cost] + c2
      possible_paths[v2]= { :cost => total_cost, :last_edge => nil }
    end
  end
  shortest_paths
end
