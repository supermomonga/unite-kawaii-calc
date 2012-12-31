" kawaii-calc source for unite.vim
" Version:     0.0.1
" Last Change: 31 Dec 2012
" Author:      momonga
" Licence:     The MIT License {{{
"     Permission is hereby granted, free of charge, to any person obtaining a copy
"     of this software and associated documentation files (the "Software"), to deal
"     in the Software without restriction, including without limitation the rights
"     to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
"     copies of the Software, and to permit persons to whom the Software is
"     furnished to do so, subject to the following conditions:
"
"     The above copyright notice and this permission notice shall be included in
"     all copies or substantial portions of the Software.
"
"     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
"     IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
"     FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
"     AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
"     LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
"     OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
"     THE SOFTWARE.
" }}}

" define source
function! unite#sources#kawaii_calc#define()
  return s:source
endfunction

" source
let s:source = {"name" : "kawaii-calc"}

" 計算式の答えを返す
function! s:calc(str)
  return eval(a:str)
endfunction

" 計算式と答えを返す
function! s:expline(expr)
  if empty(a:expr)
    return ''
  else
    return a:expr . ' = ' . s:calc(a:expr)
  endif
endfunction

" kawaii-calc
function! s:source.change_candidates(args, context)
  let list = [{
        \"word" : s:expline(a:context.input),
        \"kind" : "word"
        \}]
  return list 
endfunction
