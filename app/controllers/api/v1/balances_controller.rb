class Api::V1::BalancesController < ApplicationController
  before_action :set_balance, only: [:subtract, :show]

  # Cria o saldo inicial
  def create
    initial_value = params[:balance][:initial_value].to_d
    final_value = initial_value

    balance = Balance.new(initial_value: initial_value, final_value: final_value)

    if balance.save
      render json: { message: "Initial balance set successfully", balance: balance }, status: :created
    else
      render json: { error: balance.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # Subtrai um valor do saldo
  def subtract
    value_to_subtract = subtract_params[:value].to_d

    if value_to_subtract <= 0
      render json: { error: "Subtraction value must be a positive number" }, status: :unprocessable_entity
      return
    end

    if @balance.final_value.nil?
      render json: { error: "Final value not set" }, status: :unprocessable_entity
      return
    end

    new_balance = @balance.final_value - value_to_subtract

    if @balance.update(final_value: new_balance)
      render json: { message: "Balance updated successfully", balance: @balance }, status: :ok
    else
      render json: { error: "Failed to update balance" }, status: :unprocessable_entity
    end
  end

  # Recupera um saldo específico
  def show
    render json: { balance: @balance }, status: :ok
  end

  private

  def set_balance
    @balance = Balance.find_by(id: params[:id]) # Busca pelo id na URL

    if @balance.nil?
      render json: { error: "Balance not found" }, status: :not_found
    elsif @balance.final_value.nil?
      render json: { error: "Final value not set" }, status: :unprocessable_entity
    end
  end

  def subtract_params
    params.require(:balance).permit(:value)
  end
end
