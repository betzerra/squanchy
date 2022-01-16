require 'telegram/bot'

class TelegramController < Telegram::Bot::UpdatesController

  def start!(word = nil, *other_words)
    respond_with :message, text: "Hi"
  end

  def brizufrase!
    random_post = Post.all.sample(1).first
    respond_with :message, text: random_post.content
  end
end