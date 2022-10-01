# frozen_string_literal: true

# Useful methods to get inputs
class Utilities
  def self.validate_input(from, to)
    option = gets.chomp.to_i

    if option >= from && option <= to
      option
    else
      puts "Invalid option, try again (use a valid number from #{from} to #{to})"
      false
    end
  end

  def self.get_input(label)
    print "#{label}:"
    gets.chomp
  end
end
