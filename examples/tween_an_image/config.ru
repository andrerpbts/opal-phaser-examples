require 'bundler'
Bundler.require

opal = Opal::Server.new {|s|
  s.append_path '.'
  s.append_path '../assets'
  s.main = 'tween_an_image'
}

map '/assets' do
  run opal.sprockets
end

get '/' do
  <<-HTML
    <!doctype html>
    <html>
      <head>
        <title>Tween An Image</title>
        </style>
        <script src="http://cdnjs.cloudflare.com/ajax/libs/phaser/2.2.1/phaser.min.js"></script>
        <script src="/assets/tween_an_image.js"></script>
      </head>
      <body>
        <script>
          window.onload = function() {
            Opal.TweenAnImage.$new()
          }
        </script>
      </body>
    </html>
  HTML
end

run Sinatra::Application
