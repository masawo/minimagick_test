require 'mini_magick'

image = MiniMagick::Image.open("food.jpeg")
result = image.composite(MiniMagick::Image.open("overlay.png", "jpg")) do |c|
  c.gravity "northeast"
  c.quality "75"
end
result.write "output_minimagick.jpg"
