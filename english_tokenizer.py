from nltk import word_tokenize
import sys
    
text = sys.stdin.read()
print(" ".join(word_tokenize(text)))