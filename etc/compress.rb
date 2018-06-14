dir = Dir["**/*.{html,js,json,css}"]
dir.each do |a|
  `gzip -9fk "#{a}"`
  `brotli -9fk "#{a}"`
end

if ARGV[0] == "-i"
  dir = Dir["img/**/*.png"].sort
  dir.each do |a|
    `cwebp -lossless "#{a}" -o "#{a}".webp`
  end
end
