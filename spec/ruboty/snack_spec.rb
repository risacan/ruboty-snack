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
      🎂 🍮 🍬 🍭 🍫 🍿 🍩 🍪 🍄
    ).map{ |snack| "つ#{snack}" }
  end

  describe "#feed_snack" do
    it "gives a snack" do
      expect(robot).to receive(:say).with(
        hash_including(
          body: satisfy { |v| hand_with_snack.include?(v) }
        )
      )
      robot.receive(body: "#{robot.name} お腹すいた")
    end
  end
end
