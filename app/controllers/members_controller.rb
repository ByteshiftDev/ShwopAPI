class MembersController < ApplicationController
  before_action :set_member, only: [:show, :update, :destroy]

  # GET /members
  def index
    @members = Member.all

    @members.each do |member|
      member.add_key
    end

    render json: @members
  end

  # GET /members/1
  def show
    @member.add_key
    render json: @member
  end

  # POST /members
  def create
    @member = Member.new(member_params)

    if @member.save
      # Invoke send email method here
      # member.confirmation_token
      render json: @member, status: :created, location: @member
    else
      render json: @member.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /members/1
  def update
    if @member.update(member_params)
      render json: @member
    else
      render json: @member.errors, status: :unprocessable_entity
    end
  end

  # DELETE /members/1
  def destroy
    @member.destroy
  end

  def confirm
    token = params[:token].to_s

    member = Member.find_by(confirmation_token: token)

    if member.present? && member.confirmation_token_valid?
      member.mark_as_confirmed!
      render json: {status: 'Member confirmed successfully'}, status: :ok
    else
      render json: {status: 'Invalid token'}, status: :not_found
    end
  end

  def login
    member = Member.find_by(email: params[:email].to_s.downcase)

    if member && member.authenticate(params[:password])
      auth_token = JsonWebToken.encode({member_id: member.id})
      render json: {auth_token: auth_token}, status: :ok
    else
      render json: {error: 'Invalid membername / password'}, status: :unauthorized
    end
  end

private
  # Use callbacks to share common setup or constraints between actions.
  def set_member
    @member = Member.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def member_params
    params.fetch(:member, {})
  end

end
