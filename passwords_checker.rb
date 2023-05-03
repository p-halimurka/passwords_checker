class PasswordsChecker
  LINE_PARTS_SIZE = 3
  RANGE_DELINEATOR = '-'.freeze
  LINE_PARTS_DELINEATOR = ' '.freeze
  RANGE_PART_REDUNDANT_CHARACTER = ':'.freeze

  def initialize(file_path)
    @file_path = file_path
  end

  def call
    read_file
    if @file_lines.any?
      parse_character_count_condition
      count_valid_passwords
    else
      'Please input path to valid file / add password conditions to it'
    end
  end

  private

  def read_file
    @file_lines = File.readlines(@file_path).select { |line| line.split(LINE_PARTS_DELINEATOR).size == LINE_PARTS_SIZE }
  rescue Errno::ENOENT
    @file_lines = []
  end

  def parse_character_count_condition
    @character_count = {}
    @character_condition = {}
    @file_lines.each.with_index do |line, index|
      line_parts = line.split(LINE_PARTS_DELINEATOR)
      character_key = "#{line_parts.first}_#{index}"
      count_range_points = line_parts[1].gsub(RANGE_PART_REDUNDANT_CHARACTER, '').split(RANGE_DELINEATOR).map(&:to_i)
      count_range = count_range_points.first..count_range_points.last
      @character_count[character_key] = count_range
      @character_condition[character_key] = line_parts.last
    end
  end

  def count_valid_passwords
    result = 0
    @character_count.each do |character_key, count_range|
      character = character_key.split('_').first
      number_of_characters = @character_condition[character_key].count(character)
      result += 1 if count_range.cover?(number_of_characters)
    end
    "#{result} valid passwords in given file"
  end
end
