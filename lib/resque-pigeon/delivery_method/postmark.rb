require 'mail'
require 'postmark'

require 'resque-pigeon/delivery_method/delivery'

module Resque
  module Pigeon
    module DeliveryMethod
      class Postmark
        include Delivery

        ::Postmark.secure = Config.postmark[:secure]

        attr_reader :message

        def initialize(*args)
          @message = ::Mail.new(args)
          default_body
          default_attachments
        end

        def default_body
          message.text_part = ::Mail::Part.new do
            body('Sent via resque-pigeon.')
          end
        end

        def default_attachments
          message.postmark_attachments = []
        end

        def add_attachment(name, content, type="application/octet-stream")
          message.postmark_attachments = (message.postmark_attachments || []) << {
            "Name"        => name,
            "Content"     => [content].pack("m"),
            "ContentType" => type
          }
        end

        def send!
          message.delivery_method(
            ::Mail::Postmark,
            api_key: Config.postmark[:api_key]
          )
          message.deliver
        end
      end
    end
  end
end
