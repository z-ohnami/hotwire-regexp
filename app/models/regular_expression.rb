class RegularExpression
  include ActiveModel::Model

  attr_reader :expression
  attr_reader :test_string

  validate :check_expression

  def initialize(expression: '', test_string: '')
    @expression = expression
    @test_string = test_string
  end

  def unready?
    @expression.blank? || @test_string.blank?
  end

  private

  def regexp
    @regexp ||= Regexp.new(expression)
  end

  def check_expression
    return if regexp.match?(test_string)

    errors.add(:base, :invalid, message: '一致しませんでした...')
  end
end
