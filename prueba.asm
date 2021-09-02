                                                                                                                                             
org 100h

.MODEL SMALL
.STACK 100H
.DATA
MSG1 DB 'Para Suma presione   :'1'$'
MSG2 DB 10,13,'Para Resta presione   :'2'$'
MSG3 DB 10,13,'Fara Multiplicacion presione   :'3'$'
MSG4 DB 10,13,'Para Division Presione   :'4'$'
MSG5 DB 10,13,'Seleccione una opcion:$'
MSG6 DB 10,13,10,13,'Ingrese Primer Numero:$'
MSG7 DB 10,13,'Ingrese Segundo Numero:$'
MSG8 DB 10,13,10,13,'El Resultado es:$' 
MSG DB 10,13,10,13,'               ***Gracias por su atencion GRUPO #4***$'

 NUM1 DB ?
NUM2 DB ?
RESULT DB ?
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    LEA DX,MSG1
    MOV AH,9
    INT 21H
    
    LEA DX,MSG2
    MOV AH,9
    INT 21H
    
    LEA DX,MSG3
    MOV AH,9
    INT 21H
    
    LEA DX,MSG4
    MOV AH,9
    INT 21H 
    
    
    
    LEA DX,MSG5
    MOV AH,9
    INT 21H
    
  
    MOV AH,1
    INT 21H
    MOV BH,AL
    SUB BH,48
    
    CMP BH,1
    JE ADD
    
    CMP BH,2
    JE SUB
     
    CMP BH,3
    JE MUL
    
    CMP BH,4
    JE DIV
    
    
  ADD:
    LEA DX,MSG6  ;ENTER 1ST NUMBER
    MOV AH,9
    INT 21H 
    
    MOV AH,1
    INT 21H
    MOV BL,AL
    
    LEA DX,MSG7    ;ENTER 2ND NUMBER
    MOV AH,9
    INT 21H 
    
    
    
    MOV AH,1
    INT 21H
    MOV CL,AL
    
    ADD AL,BL
    MOV AH,0
    AAA
    
    
    MOV BX,AX 
    ADD BH,48
    ADD BL,48 
    
 
    
    LEA DX,MSG8
    MOV AH,9
    INT 21H
    
    
    MOV AH,2
    MOV DL,BH
    INT 21H
    
    MOV AH,2
    MOV DL,BL
    INT 21H
    
    ;LEA DX,MSG
    ;MOV AH,9
    ;INT 21H 
    
    JMP EXIT_P 

SUB:
 
    LEA DX,MSG6  ;ENTER 1ST NUMBER
    MOV AH,9
    INT 21H 
    
    MOV AH,1
    INT 21H
    MOV BL,AL
    
    LEA DX,MSG7    ;ENTER 2ND NUMBER
    MOV AH,9
    INT 21H 
    
    
    
    MOV AH,1
    INT 21H
    MOV CL,AL
    
    SUB BL,CL
    ADD BL,48
    
    
    
    
    LEA DX,MSG8
    MOV AH,9
    INT 21H
    
    
    MOV AH,2
    MOV DL,BL
    INT 21H
    
    
    
    ;LEA DX,MSG
    ;MOV AH,9
    ;INT 21H
    
    
    
    JMP EXIT_P 

 MUL:
 
    LEA DX,MSG6
    MOV AH,9
    INT 21H
    
    
    MOV AH,1
    INT 21H
    SUB AL,30H
    MOV NUM1,AL
    
    
    LEA DX,MSG7
    MOV AH,9
    INT 21H 
    
    
    MOV AH,1
    INT 21H
    SUB AL,30H
    MOV NUM2,AL
    
    
    MUL NUM1
    MOV RESULT,AL
    AAM  
    
    
    ADD AH,30H
    ADD AL,30H
    
    
    MOV BX,AX 
    
    
    LEA DX,MSG8
    MOV AH,9
    INT 21H 
    
    MOV AH,2
    MOV DL,BH
    INT 21H
    
    MOV AH,2
    MOV DL,BL
    INT 21H
    
    ;LEA DX,MSG
    ;MOV AH,9
    ;INT 21H 
    
    
    
    JMP EXIT_P  
       
    
                      
                      
                              
