import os
from collections import deque

wordsToHighlight = ["root", "mv", "rm"]

def highlightWords(file, wordsToHighlight):
    with open(file, "r") as f:
        contents = f.read()

    result = []
    current_word = ""
    for i, ch in enumerate(contents):
        if ch.isalpha():
            current_word += ch
        if not ch.isalpha() or i == len(contents) - 1:
            if current_word.lower() in wordsToHighlight:
                if ch != "`":
                    current_word = '`' + current_word.lower() + '`'

            result.append(current_word)
            if not ch.isalpha():
                result.append(ch)
                
            current_word = ""


    with open(file, "w") as f:
        f.write("".join(result))



queue = deque(os.listdir())

while len(queue) > 0:
    file = queue.pop()
    if os.path.isdir(file):
        for temp_file in os.listdir(file):
            queue.append(os.path.join(file, temp_file))

    elif os.path.basename(file) == "DESCRIPTION.md":
        highlightWords(file, wordsToHighlight)


