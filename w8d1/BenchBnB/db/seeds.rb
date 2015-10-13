# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
benches = Bench.create([
  {
    description: "Precious Poplar in lovely Panhandle",
    lat: 37.772431,
    lng: -122.4459674,
    seating: 4,
  },

  {
    description: "Scenic Cedar at Twin Peaks",
    lat: 37.756204,
    lng: -122.447505,
    seating: 2,
  },

  {
    description: "Brazen Basla on Breezy Ocean Beach",
    lat: 37.760259,
    lng: -122.510234,
    seating: 3,
  },

  {
    description: "Elegant Elm at Sea Cliff",
    lat: 37.787960,
    lng: -122.490958,
    seating: 23,
  },

  {
    description: "Topsy Turvy Lombard",
    lat: 37.802063,
    lng: -122.419047,
    seating: 1,
  },

  {
    description: "Historic Hemlock on Hippie Napping Grounds",
    lat: 37.770098,
    lng:  -122.446866,
    seating: 420,
  }

])
