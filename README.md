#Demystify

Demystify is a gem to help you deal with text, for text analysis or NLP projects.

## Installation

Add this line to your application's Gemfile:

```ruby
  gem 'demystify'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install demystify

##Usage

Make a Text object using your text file.
```ruby
  text = Demystify::Text.new('./my_text_file.txt')
```

Get an array of all characters, words or sentences:
```ruby
  text.chars
  text.words
  text.sentences
```

Count the number of all characters, spaces, new lines, non-whitespace characters,
punctuation, symbols, letters, non-letters, words and sentences:
```ruby
  text.char_count
  text.spaces_count
  text.new_line_count
  text.non_whitespace_char_count
  text.punctuation_count
  text.symbol_count
  text.letter_count
  text.non_letter_count
  text.word_count
  text.sentence_count
```

Check for the number of occurrences of a particular sequence of characters:
```ruby
text.sequence_count(sequence)
```

Get the first word or last word of every sentence in an array:
```ruby
text.first_words
text.last_words
```

Get the average length of a word or average number of words per sentence:
```ruby
text.average_word_length
text.average_sentence_length
```


Get a hash of every word in the text of pointing to an array of all of its following or preceding words in the text:
```ruby
text.forwards_probability_hash
text.backwards_probability_hash
```
