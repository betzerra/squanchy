require 'telegram/bot'

class TelegramController < Telegram::Bot::UpdatesController

  def start!(word = nil, *other_words)
    respond_with :message, text: "Hi"
  end

  # Returns a Brizufrase (mostly Bunny quotes)
  def brizufrase!
    tag = Tag.where(title: 'Brizu').first
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

  # Returns anything but a Brizufrase
  def frase!
    tag = Tag.where(title: 'Brizu').first
    if tag.nil?
      respond_not_found
      return
    end

    random_post = Post
      .where
      .not(:id => tag.posts.select(:id))
      .sample(1)
      .first

      respond_with :message, text: random_post.content
  end

  def sztajnszrajber!
    respond_with :message, text: Sztajnszrajber.phrase
  end

  private

  def respond_not_found
    respond_with :message, text: 'No encontrĂ© ninguna frase'
  end
end