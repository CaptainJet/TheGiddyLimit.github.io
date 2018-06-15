require 'json'
files = Dir["bestiary-*.json"]
files.each do |a|
	json = JSON.parse(File.read(a))
	sclips = json['monster'].collect do |b| b["soundClip"] end
	sclips.delete('""')
	sclips.compact!
	sclips.each do |c| `wget #{c}` end
end