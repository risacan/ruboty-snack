require "ruboty"
require "open-uri"
require "json"
require "pp"

module Ruboty
  module Handlers
    class Snack < Base
      class << self
        def emojis
          @emojis ||= load_emojilib
        end

        def load_emojilib
          emojilib_json = "https://raw.githubusercontent.com/muan/emojilib/master/emojis.json"
          emojilib = JSON.parse(open(emojilib_json).read)
          food_keywords = ["dessert", "fruit", "food", "sweet", "snack"]
          drink_keywords = ["drink", "beverage"]
          food = emojilib.each_with_object([]) do |(key, value), item|
            item << value["char"] unless (value["keywords"] & food_keywords).empty?
          end
          drink = emojilib.each_with_object([]) do |(key, value), item|
            item << value["char"] unless (value["keywords"] & drink_keywords).empty?
          end
          food - drink - ["🍾", "🍼", "🍽", "🎣"]
        end
      end

      on(
        /お腹すいた\z/i,
        name: "feed_snack",
        description: "おやつくれます"
      )

      def feed_snack(message)
        message.reply("つ#{emojis.sample}")
      end

      def emojis
        self.class.emojis
      end
    end
  end
end
