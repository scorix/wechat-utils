module Wechat
  module Utils
    class Message

      # doc: http://mp.weixin.qq.com/wiki/11/c88c270ae8935291626538f9c64bd123.html

      def initialize
        @session = ::Patron::Session.new(base_url: 'https://api.weixin.qq.com', connect_timeout: 10, timeout: 10, force_ipv4: true)
      end

      def send_text_message(access_token, user_open_id, text, customservice: nil)
        send_message(access_token, user_open_id, :text, content: text, customservice: customservice)
      end

      def send_image_message(access_token, user_open_id, media_id, customservice: nil)
        send_message(access_token, user_open_id, :image, media_id: media_id, customservice: customservice)
      end

      def send_voice_message(access_token, user_open_id, media_id, customservice: nil)
        send_message(access_token, user_open_id, :voice, media_id: media_id, customservice: customservice)
      end

      def send_video_message(access_token, user_open_id, media_id, thumb_media_id, title, description, customservice: nil)
        send_message(
            access_token, user_open_id, :video,
            media_id: media_id,
            thumb_media_id: thumb_media_id,
            title: title,
            description: description,
            customservice: customservice
        )
      end

      def send_music_message(access_token, user_open_id, music_url, hq_music_url, thumb_media_id, title, description, customservice: nil)
        send_message(
            access_token, user_open_id, :music,
            musicurl: music_url,
            hqmusicurl: hq_music_url,
            thumb_media_id: thumb_media_id,
            title: title,
            description: description,
            customservice: customservice
        )
      end

      def send_news_message(access_token, user_open_id, articles = [])
        articles = articles.map do |article|
          hash_article = article.respond_to?(:to_hash) ? article.to_hash : article.to_h
          hash_article.deep_transform_keys { |key| key.to_s.underscore }.slice("title", "description", "url", "picurl")
        end
        send_message(
            access_token, user_open_id, :news,
            articles: articles,
            customservice: customservice
        )
      end

      def send_mpnews_message(access_token, user_open_id, media_id)
        send_message(
            access_token, user_open_id, :mpnews,
            media_id: media_id,
            customservice: customservice
        )
      end

      def send_message(access_token, user_open_id, message_type, message_body, customservice: nil)
        @session.post("/cgi-bin/message/custom/send?access_token=#{access_token}", {
            touser: user_open_id,
            msgtype: message_type.to_s,
            message_type.to_s.to_sym => message_body,
            customservice: customservice
        }.compact.to_json).body
      end

    end
  end
end
