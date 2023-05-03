require_relative 'passwords_checker'

sleep 1
puts 'Please input path to file with passwords data (path to example file: passwords_file.txt)'
path_to_file = gets.chomp
result = PasswordsChecker.new(path_to_file).call
sleep 1
puts result
