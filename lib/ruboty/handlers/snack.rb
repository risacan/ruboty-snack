require "ruboty"

module Ruboty
  module Handlers
    class Snack < Base
      OYATSU = %w(
        🌰 🍏 🍎 🍐 🍊 🍋 🍌 🍉 🍇 🍓 🍈 🍒 🍑 🍍 🍅
        🍆 🌽 🍠 🍞 🧀 🍗 🍖 🍤 🍳 🍟 🌭 🍕 🍝 🌮 🌯
        🍜 🍲 🍥 🍣 🍱 🍛 🍙 🍚 🍘 🍢 🍡 🍧 🍨 🍦 🍰
        🎂 🍮 🍬 🍭 🍫 🍿 🍩 🍪 🍄
      )

      on(
        /お腹(?<status>.+)/,
        name: "feed_snack",
        description: "Gives you some snacks"
      )

      def feed_snack(message)
        oyatsu =
          case message[:status]
          when /すい/, /空い/, /へっ/, /減/, /すき/, /空き/,
               /ペコペコ/, /ぺこぺこ/
            OYATSU.sample
          when /痛い/, /いたい/
            "💊"
          end
        message.reply("つ#{oyatsu}")
      end
    end
  end
end
