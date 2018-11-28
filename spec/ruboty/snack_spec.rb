require "spec_helper"

describe Ruboty::Snack do
  it "has a version number" do
    expect(Ruboty::Snack::VERSION).not_to be nil
  end
end

describe Ruboty::Handlers::Snack do
  let(:robot) do
    Ruboty::Robot.new
  end

  let(:hand_with_snack) do
    %w(
      🌰 🍏 🍎 🍐 🍊 🍋 🍌 🍉 🍇 🍓 🍈 🍒 🍑 🍍 🍅
      🍆 🌽 🍠 🍞 🧀 🍗 🍖 🍤 🍳 🍟 🌭 🍕 🍝 🌮 🌯
      🍜 🍲 🍥 🍣 🍱 🍛 🍙 🍚 🍘 🍢 🍡 🍧 🍨 🍦 🍰
      🎂 🍮 🍬 🍭 🍫 🍿 🍩 🍪 🍄 🥝 🥑 🥒 🥕 🌶 🥔
      🥜 🥐 🥖 🥚 🥓 🥞 🍔 🥙 🥗 🥘 🥡 
    ).map{ |snack| "つ#{snack}" }
  end

  describe "#feed_snack" do
    describe "when you are hungry" do
      %w(
        お腹すいた
        お腹空いた
        お腹空いたよ
        お腹すいて
        お腹空きすぎて早弁しちゃお
        お腹空きすぎて死にそう
        お腹ぺこぺこ
        お腹ペコペコ
        お腹減ったの
        はらへ
        ハラへ
        ハラヘ
        ﾊﾗﾍ
      ).each do |what_you_say|
        it "replies to message \"#{what_you_say}\" and gives you a snack" do
          expect(robot).to receive(:say).with(
            hash_including(
              body: satisfy { |v| hand_with_snack.include?(v) }
            )
          )
          robot.receive(body: "#{robot.name} #{what_you_say}")
        end
      end
    end

    describe "when your stomach hurts" do
      %w(
        お腹いたい
        お腹痛い
      ).each do |what_you_say|
        it "replies to message \"#{what_you_say}\" and gives you a pill" do
          expect(robot).to receive(:say).with(
            hash_including(
              body: "つ💊"
            )
          )
          robot.receive(body: "#{robot.name} #{what_you_say}")
        end
      end
    end

    describe "when you are full" do
      %w(
        お腹いっぱい！
        お腹パンパン
        お腹くるしい
      ).each do |what_you_say|
        it "replies to message \"#{what_you_say}\" and gives you a cup of coffee" do
          expect(robot).to receive(:say).with(
            hash_including(
              body: "つ☕"
            )
          )
          robot.receive(body: "#{robot.name} #{what_you_say}")
        end
      end
    end
  end
end
