" Usage:
"   Copy this file to your ~/.vim/autoload directory.
"   :edit oldfile
"   :new newfile
"   :call wdiff#highlight(2, 1)       " wdiff#highlight(winnr1, winnr2)
"
" https://gist.github.com/ynkdir/1633233

let s:save_cpo = &cpo
set cpo&vim

function wdiff#highlight(Awinnr, Bwinnr)
  let A = getbufline(winbufnr(a:Awinnr), 1, '$')
  let B = getbufline(winbufnr(a:Bwinnr), 1, '$')
  let [Amatches, Bmatches] = s:wdiff(A, B)
  call s:highlight(a:Awinnr, Amatches)
  call s:highlight(a:Bwinnr, Bmatches)
endfunction

function s:highlight(winnr, matches)
  execute a:winnr . 'wincmd w'
  call clearmatches()
  for [lnum, col, word, higroup] in a:matches
    let pat = printf('\V\%%%dl\%%%dc%s', lnum + 1, col + 1, escape(word, '\'))
    call matchadd(higroup, pat)
  endfor
  wincmd p
endfunction

function s:wdiff(A, B)
  let Amatches = []
  let Bmatches = []
  let [Apos, Awords] = s:splitlines(a:A)
  let [Bpos, Bwords] = s:splitlines(a:B)
  let Ai = 0
  let Bi = 0
  let path = s:DiffOnp.diff(Awords, Bwords)
  let i = 0
  while i < len(path)
    if path[i] == 0
      let Ai += 1
      let Bi += 1
      let i += 1
    elseif path[i] < 0
      let a = []
      while i < len(path) && path[i] < 0
        call add(a, [Apos[Ai], Awords[Ai]])
        let Ai += 1
        let i += 1
      endwhile
      let b = []
      while i < len(path) && path[i] > 0
        call add(b, [Bpos[Bi], Bwords[Bi]])
        let Bi += 1
        let i += 1
      endwhile
      if empty(b)
        for [pos, word] in a
          call add(Amatches, [pos[0], pos[1], word, 'DiffDelete'])
        endfor
      else
        for [pos, word] in a
          call add(Amatches, [pos[0], pos[1], word, 'DiffText'])
        endfor
        for [pos, word] in b
          call add(Bmatches, [pos[0], pos[1], word, 'DiffText'])
        endfor
      endif
    elseif path[i] > 0
      let b = []
      while i < len(path) && path[i] > 0
        call add(b, [Bpos[Bi], Bwords[Bi]])
        let Bi += 1
        let i += 1
      endwhile
      let a = []
      while i < len(path) && path[i] < 0
        call add(a, [Apos[Ai], Awords[Ai]])
        let Ai += 1
        let i += 1
      endwhile
      if empty(a)
        for [pos, word] in b
          call add(Bmatches, [pos[0], pos[1], word, 'DiffAdd'])
        endfor
      else
        for [pos, word] in b
          call add(Bmatches, [pos[0], pos[1], word, 'DiffText'])
        endfor
        for [pos, word] in a
          call add(Amatches, [pos[0], pos[1], word, 'DiffText'])
        endfor
      endif
    endif
  endwhile
  return [Amatches, Bmatches]
endfunction

function s:splitlines(lines)
  let res_pos = []
  let res_words = []
  let lnum = 0
  for line in a:lines
    let i = 0
    while 1
      let col = match(line, '\S\+', i)
      if col == -1
        break
      endif
      let word = matchstr(line, '\S\+', i)
      call add(res_pos, [lnum, col])
      call add(res_words, word)
      let i = col + len(word)
    endwhile
    let lnum += 1
  endfor
  return [res_pos, res_words]
endfunction

"---------------------------------------------------------------------
" G.Myers, W.Miller, An O(NP) Sequence Comparison Algorith
"---------------------------------------------------------------------
" I referred following implementation.
"
" http://ido.nu/kuma/2007/10/01/diff-onp-javascript-implementation/
"
" Copyright (c) 2007, KUMAGAI Kentaro
"
"    Redistribution and use in source and binary forms, with or without
"    modification, are permitted provided that the following conditions
"    are met:
"
" 1. Redistributions of source code must retain the above copyright
"    notice, this list of conditions and the following disclaimer.
" 2. Redistributions in binary form must reproduce the above copyright
"    notice, this list of conditions and the following disclaimer in the
"    documentation and/or other materials provided with the
"    distribution.
" 3. Neither the name of this project nor the names of its contributors
"    may be used to endorse or promote products derived from this
"    software without specific prior written permission.
"
" THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
" "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
" LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
" A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
" OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
" SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
" LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
" DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
" THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
" (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
" OF THIS SO
"---------------------------------------------------------------------

" path[x]
"   = 0   common
"   < 0   delete
"   > 0   add
let s:DiffOnp = {}

" @static
function s:DiffOnp.diff(A, B)
  return self.new(a:A, a:B).path
endfunction

function s:DiffOnp.new(...)
  let obj = deepcopy(self)
  call call(obj.__init__, a:000, obj)
  return obj
endfunction

function s:DiffOnp.__init__(A, B)
  if len(a:A) > len(a:B)
    let self.A = a:B
    let self.B = a:A
    let self.M = len(a:B)
    let self.N = len(a:A)
    let self.path = map(self.onp(), '-v:val')
  else
    let self.A = a:A
    let self.B = a:B
    let self.M = len(a:A)
    let self.N = len(a:B)
    let self.path = self.onp()
  endif
endfunction

function s:DiffOnp.onp()
  let self.fp = {}
  let self.paths = {}
  let delta = self.N - self.M
  let p = 0
  while 1
    let k = -p
    while k < delta
      let self.fp[k] = self.snake(k)
      let k += 1
    endwhile
    let k = delta + p
    while k > delta
      let self.fp[k] = self.snake(k)
      let k -= 1
    endwhile
    let k = delta
    let self.fp[k] = self.snake(k)
    if self.fp[delta] == self.N
      break
    endif
    let p += 1
  endwhile
  let path = self.paths[delta]
  " remove garbage
  if !empty(path)
    unlet path[0]
  endif
  return path
endfunction

function s:DiffOnp.snake(k)
  let k = a:k

  let i = get(self.fp, k - 1, -1) + 1
  let j = get(self.fp, k + 1, -1)
  if i > j
    if has_key(self.paths, k - 1)
      let self.paths[k] = copy(self.paths[k - 1])
    endif
    let v = 1
  else
    if has_key(self.paths, k + 1)
      let self.paths[k] = copy(self.paths[k + 1])
    endif
    let v = -1
  endif
  if !has_key(self.paths, k)
    let self.paths[k] = []
  endif
  call add(self.paths[k], v)
  let y = max([i, j])

  let x = y - k
  while x < self.M && y < self.N && self.A[x] ==# self.B[y]
    let x += 1
    let y += 1
    call add(self.paths[k], 0)
  endwhile
  return y
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
