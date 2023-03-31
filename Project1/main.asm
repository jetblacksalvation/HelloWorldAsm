includelib kernel32.lib	
includelib msvcrt.lib

.data	

	string db "hello world",10, 0 
	stdout dq ?

.code
externdef	GetStdHandle:proto	
externdef	WriteConsoleA :proto	




	main proc	
	mov rcx, -11
	call GetStdHandle
	; rax now has handle to stdout move that to stdout
	mov qword ptr [stdout], rax
	xor r8,r8

	mov rdx, offset string
	mov rcx, qword ptr[stdout]
	mov r8, 12
	call WriteConsoleA
	ret	
	main endp
	end	