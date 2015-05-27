class SlackProcessor
  def self.process!(text, trigger_word)
    new(text, trigger_word).process!
  end

  attr_reader :text, :trigger_word

  def initialize(text, trigger_word)
    @text = text
    @trigger_word = trigger_word
  end

  def process!
    Stuff.create!(content: trimmed_content)
  end

  private

  def trimmed_content
    text.gsub!(/#{trigger_word}/,"")
  end
end
