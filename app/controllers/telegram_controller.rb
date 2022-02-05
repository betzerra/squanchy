require 'telegram/bot'

class TelegramController < Telegram::Bot::UpdatesController

  def start!(word = nil, *other_words)
    respond_with :message, text: "Hi"
  end

  def brizufrase!
    tag = Tag.where(title: 'Bunny').first
    if tag.nil?
      respond_not_found
      return
    end

    random_post = tag.posts.all.sample(1).first

    if random_post.nil?
      respond_not_found
      return
    end

    respond_with :message, text: random_post.content
  end

  def frase!
    random_post = Post.all.sample(1).first
    respond_with :message, text: random_post.content
  end

  def sztajnszrajber!
    respond_with :message, text: Sztajnszrajber.phrase
  end

  private

  def respond_not_found
    respond_with :message, text: 'No encontré ninguna frase'
  end
end