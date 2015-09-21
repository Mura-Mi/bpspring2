# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

[ "Tokyo Dome",
  "Koushien Stadium",
  "Matsuda Zoom-Zoom Stadium",
  "Nagoya Dome",
  "Yokohama Stadium",
  "Jingu Stadium",
 "Fukuoka Yahoo! Japan Dome",
 "Kyocera Dome Osaka",
 "Sapporo Dome",
 "QVC Marine Field",
 "Seibu Prince Dome",
 "Rakuten Kobo Stadium Miyagi" ].each do |placeName| 
   Place.create(name: placeName);
 end
