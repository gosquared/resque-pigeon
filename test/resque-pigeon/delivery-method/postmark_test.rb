require_relative '../../test_helper'

require 'resque-pigeon/delivery_method/postmark'

module Resque
  module Pigeon
    module DeliveryMethod
      describe Postmark do
        it "works" do
          "foo".must_equal "foo"
        end
      end
    end
  end
end
