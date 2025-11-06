`grep` is not the only way to match patterns. Sometimes the real data and the garbage data are mixed in the same line,
and we want to filter out the garbage. For that, we have `sed`. `sed` provides an easy way to substitute patterns
in text with a different word. The syntax for matching and replacing is simple:

```
sed "s/oldword/newword/g"
```

`s/` - substitute  
`oldword` - the word to replace  
`newword` - the replacement for `oldword`  
`/g` - global (search for all occurrences of the pattern)  

In this challenge, `/challenge/run` will print out the flag, but between each character there will be the string
"FAKEFLAG". Your job is to filter out the garbage data from the flag. Good luck!
