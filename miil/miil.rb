require "httpclient"
require "json"
require "mini_magick"

# 新着画像を拾い、オーバーレイ画像をのせる

def conv(image_path, filename)
	image = MiniMagick::Image.open(image_path)
	result = image.composite(MiniMagick::Image.open("../images/overlay.png", "jpg")) do |c|
		c.gravity "northeast"
		c.quality "75"
	end
	result.write "output/#{filename}"
end

c = HTTPClient.new
res = c.get_content("http://miil.me/photos/index2.json")
data = JSON.parse(res)
data["photos"].each do |item|
	# http://miil.me/p/XXXX
	url_str = /\w+$/.match(item["page_url"]).to_s
	puts "generate '#{url_str}'"
	conv(item["url"], url_str+".jpg")
end
puts 'done.'
