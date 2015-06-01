.386 
.model flat,stdcall 
option casemap:none 
include ..\include\windows.inc 
include ..\include\user32.inc 
include ..\include\kernel32.inc 

.DATA?   
hHeap HANDLE ?


.CODE

AllocateHeap macro
    LOCAL @call
	mov eax, hHeap
	test eax,eax
	jnz @call
	call GetProcessHeap
	mov hHeap, eax
@call:	
	endm


AllocateMemory PROC  dwSize:DWORD
	AllocateHeap

	INVOKE HeapAlloc, eax, HEAP_ZERO_MEMORY or HEAP_GENERATE_EXCEPTIONS, dwSize;[esp-4]
    ret
AllocateMemory ENDP

DeAllocateMemory  PROC pointer:PTR DWORD
	AllocateHeap

	INVOKE HeapFree, eax, 0, pointer
    ret
DeAllocateMemory ENDP

public ReAllocateMemory@8
ReAllocateMemory@8: ;  PROC ; pointer:PTR DWORD,dwSize:DWORD
	@dwSize = 8
	@pointer = 4
	AllocateHeap
	mov ecx,[esp+@dwSize]
	mov edx,[esp+@pointer]
	INVOKE HeapReAlloc, eax, HEAP_ZERO_MEMORY or HEAP_GENERATE_EXCEPTIONS, edx, ecx
    ret
;ReAllocateMemory ENDP

END