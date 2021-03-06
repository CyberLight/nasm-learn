
global _start

section .text
	
_start:	mov ecx, 256		;заносим в ecx длину массива 256 байт
	mov edi, array		;заносим адрес области памяти метки array
	mov al, '@'		;заносим символ @ в младший регистр al,
				;им будем заполнять массив
	
again:	mov [edi], al		;заносим символ @ из al по адресу расположенному в edi регистре
	inc edi			;увеличиваем адрес в регистре edi на 1,
				;тем самым подготавливаем следующий байт массива для изменения
	dec ecx			;уменьшаем наш счетчик на 1 для контроля кол-ва измененных байт массива
	jnz again		;если значение ecx регистра не 0 то можно повторить операцию,
				;перейдя на метку again

	;; Процедура вывода заполненного массива в STD_OUT
	xor eax, eax		;очищаем eax
	xor ebx, ebx		;очищаем ebx
	xor ecx, ecx		;очищаем ecx
	xor edx, edx		;очищаем edx
	add al, 4		;номер функции write
	add bl, 1		;1 означает что будет проивзодится вывод на STD_OUT
	add ecx, array		;заносим адрес нашего массива данных из секции bss 
	add edx, 256		;указываем длину массива
	int 0x80		;вызов syscall для исполнения функции
	
	;; Завершение программы с 0 кодом
	xor eax, eax 		;очищаем eax
	xor ebx, ebx		;очищаем ebx для того чтобы завершить программу с кодом 0
	add eax, 1  		;номер функции exit
	int 0x80		;вызов syscall для выполнения функции exit
	
section .bss
	array resb 256 		;выделяем 256 байт под переменную array
				;естественно если посмотреть на эту область памяти посредством gdb
				;то можно заметить что в каждой ячейке находится 0x00
				;т.е. массив не проинициализирован значениями.
	
