# Text-Analysis

# Introduction to Text Analysis using Python
##
##
### ________________________________________________________

## Simple Examples: 
### string to experiment with: place
place = "poolhouse"

### Use upper() on place: place_up
place_up= place.upper()

### Print out place and place_up
print(place)
print(place_up)

### Print out the number of p's in place
print(place.count('p'))

### Print out the number of u's in place
print(place.count('u'))

### Print out the number of o's in place
print(place.count('o'))

### ________________________________________________________

### Regex patterns
### ________________________________________________________

import re

my_string = "Introduction to Text Analysis using Python"

re.findall(r"\s+", my_string)

re.findall(r"\w+", my_string)

re.findall(r"[a-z]", my_string)

re.findall(r"\w", my_string)

### ________________________________________________________

### Word tokenization 

The NLTK library can provide us a way to tokenize both words and sentences from Python strings.  we can use **word_tokenize** and **sent_tokenize** from **nltk.tokenize**. 


### Import necessary modules
from nltk.tokenize import sent_tokenize
from nltk.tokenize import word_tokenize


### Split scene_one into sentences: sentences
sentences = sent_tokenize(scene_one)

### Use word_tokenize to tokenize the fourth sentence: tokenized_sent
tokenized_sent = word_tokenize(sentences[3])

### Make a set of unique tokens in the entire scene: unique_tokens
unique_tokens = set(word_tokenize(scene_one))

### Print the unique tokens result
print(unique_tokens)


Running topic modeling using R and . 
It has focused on LDA.  
