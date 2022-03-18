" cann JavaMantra and pass the current line number
command JMantra :call JavaMantra(line('.'))

function JavaMantra(lineNum)
    call append(a:lineNum - 1, 'public class Main {')
    call append(a:lineNum + 0, '    public static void main(String args[]) {')
    call append(a:lineNum + 1, '    }')
    call append(a:lineNum + 2, '}')
endfunction
