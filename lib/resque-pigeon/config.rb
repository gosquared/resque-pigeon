module Resque
  module Pigeon
    module Config
      extend self

      def postmark
        {
          :api_key    => ENV['POSTMARK_API_KEY'],
          :secure     => ENV['POSTMARK_SECURE'] || true,
          :queue_name => ENV['POSTMARK_QUEUE'] || 'postmark'
        }
      end

      def twitter
        {
          :consumer_key       => ENV['TWITTER_CONSUMER_KEY'],
          :consumer_secret    => ENV['TWITTER_CONSUMER_SECRET'],
          :oauth_token        => ENV['TWITTER_OAUTH_TOKEN'],
          :oauth_token_secret => ENV['TWITTER_OAUTH_TOKEN_SECRET']
        }
      end
    end
  end
end
