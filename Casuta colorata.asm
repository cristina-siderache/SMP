.model small
.stack 100h

.data
msg1    db      10, 13, 10, 13, "Optiuni cate vrei, nu acum",0Dh,0Ah,0Dh,0Ah,09h
        db      "1- Alege culoare",0Dh,0Ah,09h
        db      "2- Despre",0Dh,0Ah,09h      
        db      "3- Exit",0Dh,0Ah,09h
        db      "Alege optiuni: " 
        db      '$'   
        
msg2    db      10, 13, 10, 13, "Culori",0Dh,0Ah,0Dh,0Ah,09h
        db      "1- Albastru",0Dh,0Ah,09h
        db      "2- Verde",0Dh,0Ah,09h 
        db      "3- Cyan",0Dh,0Ah,09h 
        db      "4- Rosu",0Dh,0Ah,09h 
        db      "5- Magenta",0Dh,0Ah,09h       
        db      "6- Galben",0Dh,0Ah,09h 
        db      "7- Alb",0Dh,0Ah,09h  
        db      "8- Inapoi",0Dh,0Ah,09h
        db      "Alege: " 
        db      '$'
        
Despre   db      10, 13, 10, 13, "Random Text!  - Cristina Siderache 332 AA$"

handle  dw  ? 
  
  
.code
main proc 
    mov   ax,@data
    mov   ds,ax

ShowMenu:       
    lea     dx, msg1  
    mov     ah, 09h 
    int     21h     
        
getnum:        
    mov     ah, 1 
    int     21h        
    
    cmp     al, '1' 
    jl      ShowMenu   
    cmp     al, '3'
    jg      ShowMenu 
        
    cmp     al, "1"
    je      Submenu
    cmp     al, "2"
    je      ArataDespre
    cmp     al, "3"
    jmp     Quit
;    cmp     al, "4"
;    jmp     CodeForMenu4
;    etc...
        
Quit: 
   mov   ah,4ch
   int   21h
      

ArataDespre:       
    lea     dx, Despre  
    mov     ah, 09h 
    int     21h    
    jmp     ShowMenu 
    
    
Submenu: 
     lea     dx, msg2  
     mov     ah, 09h 
     int     21h  
getnum1:        
    mov     ah, 1 
    int     21h        
    
    cmp     al, '1' 
    jl      Submenu   
    cmp     al, '8'
    jg      Submenu 
        
    cmp     al, "8"
    je      ShowMenu
    cmp     al, "1"
    je      Blue
    cmp     al, "2"  
    je      Green 
    cmp     al, "3"  
    je      Cyan
    cmp     al, "4"  
    je      Red
    cmp     al, "5"  
    je      Magenta
    cmp     al, "6"  
    je      Galben
    cmp     al, "7"  
    je      Alb
    jmp     DesenCasa

     
Blue: 
     mov bh, 9
    jmp DesenCasa
Green:           
      mov bh,10 
    jmp DesenCasa
Cyan:            
      mov bh,11
    jmp DesenCasa
Red:             
     mov bh,4
    jmp DesenCasa  
Magenta:             
     mov bh,13
    jmp DesenCasa
Galben:             
     mov bh,14
    jmp DesenCasa
Alb:             
     mov bh,15
    jmp DesenCasa
Maro:             
     mov bh,6
    jmp DesenCasa                
    
DesenCasa:    
    


 ;Secventa de cod pentru dreptunghiul principal

w equ 80 ; dimensiune dreptunghi
h equ 60

	 mov ah, 0
     mov al, 13h ; trecere in mod grafic 320x200
     int 10h 

	 
     ; desenare latura superioara
     mov cx, 100+w ; coloana
     mov dx, 100 ; rand
     mov al, bh  ; culoare
u1:  
	 mov ah, 0ch ; afisare pixel/ desen
     int 10h
     dec cx
     cmp cx, 100    ;coloana    
jae u1


     ; desenare latura inferioara
     mov cx, 100+w	;coloana
     mov dx, 100+h  ;rand
     mov al, bh 
u2:  
	 mov ah, 0ch
     int 10h
     dec cx
     cmp cx, 100
ja u2


     ;desenare latura din stanga
     mov cx, 100	;coloana
     mov dx, 100+h  ;rand
     mov al, bh
u3:  
	 mov ah, 0ch
     int 10h
     dec dx
     cmp dx, 100   ;rand
ja u3


     ; latura din dreapta
     mov cx, 100+w  ;coloana 
     mov dx, 100+h  ;rand
     mov al, bh   
u4:  
	 mov ah, 0ch
     int 10h
     dec dx
     cmp dx, 100  ;rand
ja u4
    

;Secventa de cod pentru triunghi

;nu a mai fost nevoie de o repozitionare, deoarece desenul continua din pozitia anterioara
triunghi1:
mov ah, 0ch
int 10h
dec cx
dec cx

sub dx, 2
inc bl
cmp bl, 20 ;jumatatea laturi ; limita laturi drepte
jl triunghi1

;initializare desen latura din stanga
mov bl, 0
mov cx, 100  ;coloana
mov dx, 100  ;rand
mov al, 4   ;culoare
triunghi2:
mov ah, 0ch
int 10h
inc cx
inc cx

sub dx, 2
inc bl
cmp bl, 21  ;jumatatea laturi +1 ; limita laturi stangi
jl triunghi2
    

;Secvente de cod pentru elementele decorative
;Usa

w_usa equ 10
h_usa equ 30 

	;initializare pozitie pentru latura superioara
		 mov cx, 135+w_usa ; coloana
		 mov dx, 130 ; rand
		 mov al, bh  ; alb
usa1:
		 mov ah, 0ch ; afisare pixel
		 int 10h
		 dec cx
		 cmp cx, 135
jae usa1


    ;initializare pozitie pentru latura stanga
		mov cx, 135        ; coloana
		mov dx, 130+h_usa  ;rand
		mov al, bh
usa2:  	
		mov ah, 0ch
		int 10h
		dec dx
		cmp dx, 130   ;rand
ja usa2


     ;initializare pozitie pentru latura dreapta
		 mov cx, 135+w_usa  ; coloana
		 mov dx, 130+h_usa  ;rand
		 mov al, bh   
usa3: 	 
		 mov ah, 0ch
		 int 10h
		 dec dx
		 cmp dx, 130  ;rand
ja usa3
       
     
;Geam usa + maner
w_ge equ 6
h_ge equ 10 

     mov cx, 137+w_ge ; coloana
     mov dx, 132 ; rand
     mov al, bh  ; alb
ge1:
     mov ah, 0ch ; afisare pixel
     int 10h
     dec cx
     cmp cx, 137
jae ge1
     
     
     mov cx, 137+w_ge  ; coloana
     mov dx, 132+h_ge  ;rand
     mov al, bh  
ge2:  
	 mov ah, 0ch
     int 10h
     dec cx
     cmp cx, 137
ja ge2
    
    
     mov cx, 137
     mov dx, 132+h_ge  ;rand
     mov al, bh
ge3: 
	 mov ah, 0ch
     int 10h
     dec dx
     cmp dx, 132   ;rand
ja ge3
     
	 
     mov cx, 137+w_ge  ; coloana
     mov dx, 132+h_ge  ;rand
     mov al, bh   
ge4:  
	 mov ah, 0ch
     int 10h
     dec dx
     cmp dx, 132  ;rand
ja ge4
     
     
     ;maner
     mov cx, 137+2  ; coloana
     mov dx, 145  ;rand
     mov al, bh
maner:
     mov ah, 0ch ; afisare pixel
     int 10h
     dec cx
     cmp cx, 137
jae maner 
     
    
     ;setez geamul 1
    
w_geam equ 20
h_geam equ 25   

     mov cx, 107+w_geam ; coloana
     mov dx, 105 ; rand
     mov al, bh ; alb
geam1: 
	 mov ah, 0ch ; afisare pixel
     int 10h
     dec cx
     cmp cx, 107
jae geam1
     
	
     mov cx, 107+w_geam
     mov dx, 105+h_geam  ;rand
     mov al, bh 
geam2:  
	 mov ah, 0ch
     int 10h
     dec cx
     cmp cx, 107
ja geam2
     
	 
	 ; latura din stanga
     mov cx, 107
     mov dx, 105+h_geam    ;rand
     mov al, bh
geam3:  
	 mov ah, 0ch
     int 10h
     dec dx
     cmp dx, 105   ;rand
ja geam3
     
	 
	 ; latura din dreapta
     mov cx, 107+w_geam  
     mov dx, 105+h_geam  
     mov al, bh   
geam4:  
	 mov ah, 0ch
     int 10h
     dec dx
     cmp dx, 105  ;rand
ja geam4    
    
    
    ;Rama geam 1 
     mov cx, 107+w_geam ; coloana
     mov dx, 117 ; rand
     mov al, bh ; alb  
rama1:  
	 mov ah, 0ch ; afisare pixel
     int 10h
     dec cx
     cmp cx, 107
jae rama1
      
     mov cx, 117 ; coloana
     mov dx, 105+h_geam ; rand
     mov al, bh ; alb     
rama2: 
     mov ah, 0ch
     int 10h
     dec dx
     cmp dx, 105   ;rand
ja rama2
     
     
     
;setez geamul 2     
     mov cx, 153+w_geam ; coloana
     mov dx, 105 ; rand
     mov al, bh ; alb   
geam1_2:  
	 mov ah, 0ch ; afisare pixel
     int 10h
     dec cx
     cmp cx, 153
jae geam1_2
     
	 ; afisare latura inferioare
     mov cx, 153+w_geam
     mov dx, 105+h_geam  ;rand
     mov al, bh 
geam2_2:  
	 mov ah, 0ch
     int 10h
     dec cx
     cmp cx, 153
     ja geam2_2
     
	 ; latura din stanga
     mov cx, 153
     mov dx, 105+h_geam    ;rand
     mov al, bh
geam3_2:  
	 mov ah, 0ch
     int 10h
     dec dx
     cmp dx, 105   ;rand
ja geam3_2
     
	 ; latura din dreapta
     mov cx, 153+w_geam  
     mov dx, 105+h_geam  
     mov al, bh   
geam4_2: 
	 mov ah, 0ch
     int 10h
     dec dx
     cmp dx, 105  ;rand
ja geam4_2
     
    
;rama2 
     mov cx, 153+w_geam ; coloana
     mov dx, 117 ; rand
     mov al, bh ; alb  
rama1_2: 
	 mov ah, 0ch ; afisare pixel
     int 10h
     dec cx
     cmp cx, 153
jae rama1_2
      
     mov cx, 163 ; coloana
     mov dx, 105+h_geam ; rand
     mov al, bh ; alb     
rama2_2: 
     mov ah, 0ch
     int 10h
     dec dx
     cmp dx, 105   ;rand
ja rama2_2

      
mov ah,00
int 16h
     
     
               
main endp
end main
