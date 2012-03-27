require 'twitter'

# Twitter defines VALID_OPTION_KEYS as class methods, we're just sending values
# for the ones required to authenticate us 
Resque::Pigeon::Config.twitter.each do |config_key, value|
  Twitter.send(config_key, value)
end

require 'resque-pigeon/delivery_method/delivery'

module Resque
  module Pigeon
    module DeliveryMethod
      class Twitter
        include Delivery

        def initialize(*args)
        end
      end
    end
  end
end

