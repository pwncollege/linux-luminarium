import os
from collections import deque

# Add the words to highlight
wordsToHighlight = ["root", "mv", "rm", "cat"]

def highlightWords(file, wordsToHighlight):
    with open(file, "r") as f:
        contents = f.read()

    result = []
    current_word = ""
    for i, ch in enumerate(contents):
        if not ch.isalpha() or i == len(contents) - 1:
            if current_word in wordsToHighlight:
                if ch != "`":
                    current_word = '`' + current_word + '`'
            result.append(current_word)
            result.append(ch)
            current_word = ""

        else:
            current_word += ch


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


