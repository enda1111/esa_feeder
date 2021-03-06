# frozen_string_literal: true

require 'slack-notifier'

module EsaFeeder
  module Gateways
    class SlackClient
      def initialize(driver)
        @driver = driver
      end

      def notify_creation(message, post)
        driver.post attachments: [{
          pretext: message,
          title: post.full_name,
          title_link: post.url,
          color: 'good'
        }],
                    channel: post.slack_channels
      rescue Slack::Notifier::APIError => e
        puts e.inspect
        nil
      end

      private

      attr_reader :driver
    end
  end
end
