class Api::V1::Slack::StuffsController < ActionController::Base
  before_action :set_stuff, only: [:show, :update, :destroy]
    
  def index
    @stuffs = Stuff.all

    render json: slack_response(@stuffs), status: :ok
  end

  def show
    render json: slack_response(@stuff)
  end

  def create
    render json: slack_response('Trigger word do not match.'), status: :unprocessable_entity if !stuff_params[:text].start_with?(stuff_params[:trigger_word])
   
    @stuff = Stuff.new(stuff_content)

    if @stuff.save
      render json: slack_response("Edi wow! You've learned #{@stuff.content} today."), status: :created
    else
      render json: slack_response(@stuff.error), status: :unprocessable_entity
    end
  end

  private

  def set_stuff
    @stuff = Stuff.find(params[:id])
  end

  def stuff_params
    params.permit(:text, :trigger_word)
  end

  def slack_response(message)
    { text: message }
  end

  def stuff_content
    { content: stuff_params[:text].remove(stuff_params[:trigger_word]) }
  end
end
