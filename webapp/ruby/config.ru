lib = File.expand_path("../lib", __FILE__)
$:.unshift(lib) unless $:.include?(lib)

require "isucari/web"

if ENV["PROFILE"]
  require "rack-lineprof"
  use Rack::Lineprof, profile: "lib/isucari/web.rb"
end

run Isucari::Web
