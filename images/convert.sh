# http://www.randomsequence.com/articles/overlaying-images-with-imagemagick/
convert food.jpeg overlay.png -gravity northeast -composite -format jpg -quality 75 output.jpg
