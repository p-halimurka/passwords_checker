class PasswordsChecker
  def initialize(file)
    @file = file
  end

  def call
    parse_file
    count_correct_passwords
    @result
  end

  private

  def parse_file
  end

  def count_correct_passwords
  end
end
