def complete(t,opts):
  """ how to call this:

  global !p
  import os
  import sys
  sys.path.append(os.path.expanduser('~/.vim/python'))
  from ultisniphelpers import *
  endglobal

  snippet '^t' "Example completion snippet" r
  $1`!p snip.rv=complete(t[1],['one','two','three','overboard'])`
  endsnippet
  """

  if t:
    opts = [ m[len(t):] for m in opts if m.startswith(t) ]
  if len(opts) == 1:
    return opts[0]
  return '('+ '|'.join(opts) +')'

