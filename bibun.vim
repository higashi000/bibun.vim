command! -nargs=1 Bibun call Bibunsitai(<f-args>)

function! Bibunsitai(formula)
  let num1 = 1
  let num2 = 1
  let num1str = ""
  let num2str = ""
  let x = ""
  let i = 0

  while i < len(a:formula)
    if '0' <= a:formula[i] && a:formula[i] <= '9'
      let num1str = num1str.a:formula[i]
    else
      break
    endif
    let i += 1
  endwhile

  while i < len(a:formula)
    if a:formula[i] <= '0' || '9' < a:formula[i]
      let x = x.a:formula[i]
    else
      break
    endif
    let i += 1
  endwhile

  while i < len(a:formula)
    if '0' <= a:formula[i] && a:formula[i] <= '9'
      let num2str = num2str.a:formula[i]
    else
      break
    endif
    let i += 1
  endwhile

  if num1str != ""
    let num1 = str2nr(num1str, 10)
  endif

  if num2str != ""
    let num2 = str2nr(num2str, 10)
  endif

  let newKeisuu = num1 * num2

  let res = printf("%d", num1 * num2).x.printf("%d", num2 - 1)

  echo res
endfunction
