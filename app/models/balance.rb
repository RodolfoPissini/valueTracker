class Balance < ApplicationRecord
  # Validação para garantir que o valor inicial seja positivo
  validates :initial_value, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :final_value, presence: true, numericality: { greater_than_or_equal_to: 0 }

  # Atualiza o valor restante quando um valor é subtraído
  def subtract(value)
    # Verifica se o valor a ser subtraído é maior que o valor restante
    if value > remaining_value
      errors.add(:remaining_value, "não pode ser negativo.")
      return false
    end
    update(remaining_value: remaining_value - value)
  end
end
