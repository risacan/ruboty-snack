require "ruboty"

module Ruboty
  module Handlers
    class Snack < Base
      OYATSU = %w(
        green_apple apple pear tangerine banana
        watermelon grapes strawberry melon cherries
        peach pineapple tomato corn sweet_potato
        bread cheese_wedge poultry_leg meat_on_bone
        fried_shrimp egg hamburger fries hotdog
        pizza spaghetti taco burrito ramen stew
        sushi bento curry rice_ball rice rice_cracker
        oden dango shaved_ice ice_cream icecream cake
        birthday custard candy lollipop chocolate_bar
        popcorn doughnut cookie chestnut mushroom
      )

      on(
        /お腹すいた\z/i,
        name: "feed_snack",
        description: "おやつくれます"
      )

      def feed_snack(message)
        message.reply("つ:#{OYATSU.sample}:")
      end
    end
  end
end
