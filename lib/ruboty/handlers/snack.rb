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
        /お腹すいた\z/i,
        name: "feed_snack",
        description: "Gives you some snacks"
      )

      def feed_snack(message)
        message.reply("つ#{OYATSU.sample}")
      end
    end
  end
end
