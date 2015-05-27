class Api::V1::Slack::StuffsController < ActionController::Base
  def create
    slack_processor = SlackProcessor.process!(text, trigger_word)

    render json: { text: "Edi wow! You've learned #{slack_processor.content} today." }, status: :created

  rescue ActiveRecord::RecordInvalid
    render json: { text: "Oops! Something went wrong." }, status: :unprocessable_entity
  end

  private

  def text
    params[:text]
  end

  def trigger_word
    params[:trigger_word]
  end

  def slack_response(message, status)
    render json: { text: message }, status: status
  end
end
