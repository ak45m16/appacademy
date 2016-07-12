# == Schema Information
#
# Table name: benches
#
#  id          :integer          not null, primary key
#  description :text             not null
#  lat         :float            not null
#  long        :float            not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

# "northEast"=> {"lat"=>"37.80971", "lng"=>"-122.39208"},
#   "southWest"=> {"lat"=>"37.74187", "lng"=>"-122.47791"}
class Bench < ActiveRecord::Base
# need to validate uniqueness of benches.
  def self.in_bounds(bounds, max_seats, min_seats)
    nelat = bounds["northEast"]["lat"]
    swlat = bounds["southWest"]["lat"]
    nelng = bounds["northEast"]["lng"]
    swlng = bounds["southWest"]["lng"]

    self.where(lat: swlat..nelat).where(lng: swlng..nelng).where(seating: min_seats..max_seats)
  end
end
