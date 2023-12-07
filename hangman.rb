# class to create a new instance of a hangman game

# steps:
# get random word
# hide word
# display instructions - request user input, show lives and number of letters in word
# 
class Hangman
  def initialize(lives = 9)
    @lives = lives
  end

  def start
    word = get_word
    puts word # for testing only
    word_array = word.split('')
    correct_guesses = word.gsub(/[A-Za-z]/, '_')
    puts correct_guesses
    guessed_letters = []

    puts "Here is your word #{correct_guesses}. You have #{@lives} lives - choose your letters wisely!"

    # add check to ensure guess is a string, can only be a letter and can only be one character long
    guess = gets.chomp
    wrong_guesses = 0
    while wrong_guesses < (@lives - 1)
      guessed_letters.push(guess)

      # only increment wrong_guesses if the guess letter isn't in the word
      result = check_guess(guess, word_array, correct_guesses)
      if !result
         wrong_guesses += wrong_guesses
      end
      # either way return the array that includes the correctly guessed letters and blanks
      puts correct_guesses
      # and either way get another guess
      guess = gets.chomp
    end
    puts "Sorry, you ran out of lives. The word was #{word}"
  end

  # private
  def get_word
    words = File.read('words.txt').split
    random_number = rand(0..(words.length - 1))
    words[random_number]
  end

  # def won?(word_array, guessed_letters)
  #   # this will return true if all the letters in the word have been guessed
  #   word_array.all? { |letter| guessed_letters.include(letter)}
  # end

  def check_guess(word_array, correct_guesses)

    # add the guess to the array of guessed_letters - only for checking win at this stage

    # check if the guessed letter is in the word
    # need a map?
    guessed_letters.map { |letter| word_array.include?(letter) ? correct_guesses.push(letter) : correct_guesses.push('_')}
    puts correct_guesses

    # check it against the 'word' array - this will also do the job of 'hiding' the word at the start of the game as 
    # the guessed_letters will intially be empty and therefore display all dashes
    # then update the hidden word to either show the letter or a dash still
    


  end
end

new_game = Hangman.new
new_game.start
