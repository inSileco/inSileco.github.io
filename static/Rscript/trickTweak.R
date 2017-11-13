nm <- "Fish and tips"
txt <- paste0(
  '## Code tips you said?\n\n',
  'Ever tumbled on a code chunk that made you say:
  "I should have known this *¶ø?!@~&* piece of code long ago!"? Chances are
  you have, frustratingly, just like we have, and on multiple occasions too.
  \n\n In comes *', nm,'*!\n\n', nm, ' is a series of blog posts that each
  present 5 -- hopefully helpful -- coding tips for a specific programming
  language.',
  '\n\n Posts should be short (*i.e.* no more than 5 lines of code,
  max 80 characters per line, except when appropriate) and provide tips of
  many kind: a function, a way of combining of functions, a single argument,
  a note about the philosophy of the language and practical consequences,
  tricks to improve the way you code, good practices, etc.\n\n',
  'Note that while some tips might be obvious for careful documentation readers
  (God bless them for their wisdom), almost all the tips we present constituted
  \n\n',
  'By the way, there are undoubtedly similar initiatives on the web (*e.g.*
  ["One R Tip a Day" account](https://twitter.com/RLangTip)). Also, feel free to
  comment below tip ideas or a post of code tips of your own which we will be
  happy to incorporate to *', nm, '*!',
  '\n\n Enjoy and get ready to frustratingly appreciate our tips!'
  )
##----
cat(txt)
