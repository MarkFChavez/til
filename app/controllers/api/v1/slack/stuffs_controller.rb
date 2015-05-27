class Api::V1::Slack::StuffsController < ActionController::Base

  def create
    slack_response("Trigger word do not match", :unprocessable_entity) if !stuff_params[:text].start_with?(stuff_params[:trigger_word])
   
    @stuff = Stuff.new(stuff_content)
    @stuff.save!

    slack_response("Edi wow! You've learned #{@stuff.content} today.", :created)

  rescue ActiveRecord::RecordInvalid
    slack_response(@stuff.errors.full_messages.to_sentence, :unprocessable_entity)
  end

  private

  def stuff_params
    params.permit(:text, :trigger_word)
  end

  def slack_response(message, status)
    render json: { text: message }, status: status
  end

  def stuff_content
    { content: stuff_params[:text].remove(stuff_params[:trigger_word]) }
  end
end
