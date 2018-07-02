require 'json'
files = Dir["data/bestiary/bestiary-*.json"]
files.each do |a|
	json = JSON.parse(File.read(a))
	sclips = json['monster'].collect do |b| b["soundClip"] end
	sclips.delete('""')
	sclips.compact!
	sclips.each do |c| `wget -N #{c} -P ./audio/bestiary/` end
end

json = JSON.parse(File.read("data/races.json"))
sclips = json['race'].collect do |b| b["soundClip"] end
sclips.delete('""')
sclips.compact!
sclips.each do |c| `wget -N #{c} -P ./audio/races/` end