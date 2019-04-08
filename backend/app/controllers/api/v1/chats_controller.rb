# class Api::V1::ChatsController < ApplicationController
#   before_action :find_chat, only: [:update]
#   def index
#     @chats = Chat.all
#     render json: @chats
#   end
#
#   def create
#     @chat.create(chat_params)
#     if @chat.save
#       render json: @chat, status: :accepted
#     else
#       render json: { errors: @chat.errors.full_messages }, status: :unprocessible_entity
#     end
#   end
#
#   def update
#     @chat.update(chat_params)
#     if @chat.save
#       render json: @chat, status: :accepted
#     else
#       render json: { errors: @chat.errors.full_messages }, status: :unprocessible_entity
#     end
#   end
#
#   private
#
#   def chat_params
#     params.permit(:message, :doctor_id, :patient_id)
#   end
#
#   def find_chat
#     @chat = Chat.find(params[:id])
#   end
# end
