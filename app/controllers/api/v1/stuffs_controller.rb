class Api::V1::StuffsController < ActionController::Base
  def create
    slack_processor = SlackProcessor.process!(params[:text], params[:trigger_word])

    render json: { text: "Edi wow! You've learned #{slack_processor.content} today." }, status: :created

  rescue ActiveRecord::RecordInvalid
    render json: { text: "Oops! Something went wrong." }, status: :unprocessable_entity
  end
end
