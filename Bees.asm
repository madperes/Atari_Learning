; '2600 Atari
; BEES Playfield
; AbInbev - Beertech
; December/2020
; Author: Marcos Adriani Peres
; https://8bitworkshop.com/




                processor 6502

                include "vcs.h"

                include "macro.h"


;------------------------------------------------------------------------------



                SEG BEES_ABI

                ORG $F000



Reset



   ; Clear RAM and all TIA registers



        ldx #0

        txa

Clear   dex

        txs

        pha

        bne Clear



       ;------------------------------------------------

       ; Once-only initialization. . .



                lda #%00000000

                sta CTRLPF             ; copy playfield
                
                lda #$0E
                sta COLUBK



	;------------------------------------------------
	; Start of new frame


StartOfFrame	

   	; Start of Vertical Sync processing



                lda #2					; or %00000010 (D1 = 1, which turn the VSYNC beam on)

                sta VSYNC				; and stores it into the VSYNC



		REPEAT 3
                	sta WSYNC			; 3 scanlines of VSYNC signal
                REPEND          



                lda #0					; or %00000000 (D1 = 0, which turn the VSYNC beam off)
	
                sta VSYNC				; and stores it into the VSYNC

                

       ;------------------------------------------------

	; Start of Vertical Blank processing (same concept of VSYNC)

            

                lda #2					

                sta VBLANK
				

                REPEAT 37
			sta WSYNC	; 37 scanlines of vertical blank
		REPEND
				
                
                lda #0
                
                sta VBLANK



      ;------------------------------------------------------------------

      ; Do 192 scanlines of color-changing (our picture)

       

               ldx #0   ; this counts our scanline number
;--------------------------------------------------------------------------

;Blank Space at the top


                
                lda #$1E
                sta COLUPF             ; set the playfield color YELLOW

                REPEAT 5
			sta WSYNC	; A few more space at the top
		REPEND

;--------------------------------------------------------------------------
;First Yellow strip
                
               lda #%11111111

               sta PF0       
               sta PF1       
               sta PF2     
               

STRIP1          sta WSYNC

                inx

                cpx #15

                bne STRIP1


               
               
;-----------------------------------------------------------------------
; LINE 1 A (line 21 according to screen size)



		lda #$1E
                sta COLUPF             ; set the playfield color YELLOW
                
                
                lda #%11110000
                sta PF0       

		lda #%11111111
		sta PF1
                

		lda #%11111111
		sta PF2       
               
               	SLEEP 13
               

               
                lda #%00110000
                sta PF0
                
                
                lda #$0
                sta COLUPF             ; set the playfield color Black
                
                             
                lda #%00111101
                sta PF1
           
                
                lda #%11000111
                sta PF2


		SLEEP 23                


;-----------------------------------------------------------------------
; LINE 1 B (line 22 according to screen size)


                lda #$1E
                sta COLUPF             ; set the playfield color YELLOW
                
                
                lda #%11110000
                sta PF0       

		lda #%11111111
		sta PF1
                

		lda #%11111111
		sta PF2       
               
               	SLEEP 13
               

               
                lda #%00110000
                sta PF0
                
                
                lda #$0
                sta COLUPF             ; set the playfield color Black
                
                             
                lda #%00111101
                sta PF1
           
                
                lda #%11000111
                sta PF2
                
                SLEEP 23
                

                


;-----------------------------------------------------------------------
; LINE 1 C (line 23 according to screen size)


                lda #$1E
                sta COLUPF             ; set the playfield color YELLOW
                
                
                lda #%11110000
                sta PF0       

		lda #%11111111
		sta PF1
                

		lda #%11111111
		sta PF2       
               
               	SLEEP 13
               

               
                lda #%00110000
                sta PF0
                
                
                lda #$0
                sta COLUPF             ; set the playfield color Black
                
                             
                lda #%00111101
                sta PF1
           
                
                lda #%11000111
                sta PF2
                
                SLEEP 23
                

                


;-----------------------------------------------------------------------
; LINE 2 A (line 24 according to screen size)

                
                lda #$1E
                sta COLUPF             ; set the playfield color YELLOW
                
                
                lda #%11110000
                sta PF0       

		lda #%11111111
		sta PF1
                

		lda #%11111111
		sta PF2       
               
               	SLEEP 13
               

               
                lda #%01110000
                sta PF0
                
                
                lda #$0
                sta COLUPF             ; set the playfield color Black
                
                             
                lda #%00111101
                sta PF1
           
                
                lda #%11100111
                sta PF2
                
                SLEEP 23


               
;-----------------------------------------------------------------------
; LINE 2 B (line 25 according to screen size)

                
                lda #$1E
                sta COLUPF             ; set the playfield color YELLOW
                
                
                lda #%11110000
                sta PF0       

		lda #%11111111
		sta PF1
                

		lda #%11111111
		sta PF2       
               
               	SLEEP 13
               

               
                lda #%01110000
                sta PF0
                
                
                lda #$0
                sta COLUPF             ; set the playfield color Black
                
                             
                lda #%00111101
                sta PF1
           
                
                lda #%11100111
                sta PF2
                
                SLEEP 23


               
;-----------------------------------------------------------------------
; LINE 2 C (line 26 according to screen size)

                
                lda #$1E
                sta COLUPF             ; set the playfield color YELLOW
                
                
                lda #%11110000
                sta PF0       

		lda #%11111111
		sta PF1
                

		lda #%11111111
		sta PF2       
               
               	SLEEP 13
               

               
                lda #%01110000
                sta PF0
                
                
                lda #$0
                sta COLUPF             ; set the playfield color Black
                
                             
                lda #%00111101
                sta PF1
           
                
                lda #%11100111
                sta PF2
                
                SLEEP 23


               
;-----------------------------------------------------------------------
; LINE 3 A (line 27 according to screen size)

                
                lda #$1E
                sta COLUPF             ; set the playfield color YELLOW
                
                
                lda #%11110000
                sta PF0       

		lda #%11111111
		sta PF1
                

		lda #%11111111
		sta PF2       
               
               	SLEEP 13
               

               
                lda #%11110000
                sta PF0
                
                
                lda #$0
                sta COLUPF             ; set the playfield color Black
                
                             
                lda #%00111101
                sta PF1
           
                
                lda #%11110111
                sta PF2
                
                SLEEP 23


               
;-----------------------------------------------------------------------
; LINE 3 B (line 28 according to screen size)

                
                lda #$1E
                sta COLUPF             ; set the playfield color YELLOW
                
                
                lda #%11110000
                sta PF0       

		lda #%11111111
		sta PF1
                

		lda #%11111111
		sta PF2       
               
               	SLEEP 13
               

               
                lda #%11110000
                sta PF0
                
                
                lda #$0
                sta COLUPF             ; set the playfield color Black
                
                             
                lda #%00111101
                sta PF1
           
                
                lda #%11110111
                sta PF2
                
                SLEEP 23


               
;-----------------------------------------------------------------------
; LINE 3 C (line 29 according to screen size)

                
                lda #$1E
                sta COLUPF             ; set the playfield color YELLOW
                
                
                lda #%11110000
                sta PF0       

		lda #%11111111
		sta PF1
                

		lda #%11111111
		sta PF2       
               
               	SLEEP 13
               

               
                lda #%11110000
                sta PF0
                
                
                lda #$0
                sta COLUPF             ; set the playfield color Black
                
                             
                lda #%00111101
                sta PF1
           
                
                lda #%11110111
                sta PF2
                
                SLEEP 23


               
;-----------------------------------------------------------------------
; LINE 4 SPACE (line 30 according to screen size)

                lda #$0E
                sta COLUPF             ; set the playfield color WHITE
		
                sta WSYNC
                sta WSYNC
                sta WSYNC
                sta WSYNC

                SLEEP 6
                
                
;-----------------------------------------------------------------------
; LINE 5 A (line 35 according to screen size)

                
                lda #$1E
                sta COLUPF             ; set the playfield color YELLOW
                
                
                lda #%11110000
                sta PF0       

		lda #%11111111
		sta PF1
                

		lda #%11111111
		sta PF2       
               
               	SLEEP 13
               

               
                lda #%01110000
                sta PF0
                
                
                lda #$0
                sta COLUPF             ; set the playfield color Black
                
                             
                lda #%00111001
                sta PF1
           
                
                lda #%01110011
                sta PF2
                
                SLEEP 23


               
;-----------------------------------------------------------------------
; LINE 5 B (line 36 according to screen size)

                
                lda #$1E
                sta COLUPF             ; set the playfield color YELLOW
                
                
                lda #%11110000
                sta PF0       

		lda #%11111111
		sta PF1
                

		lda #%11111111
		sta PF2       
               
               	SLEEP 13
               

               
                lda #%01110000
                sta PF0
                
                
                lda #$0
                sta COLUPF             ; set the playfield color Black
                
                             
                lda #%00111001
                sta PF1
           
                
                lda #%01110011
                sta PF2
                
                SLEEP 23


               
;-----------------------------------------------------------------------
; LINE 5 C (line 37 according to screen size)

                
                lda #$1E
                sta COLUPF             ; set the playfield color YELLOW
                
                
                lda #%11110000
                sta PF0       

		lda #%11111111
		sta PF1
                

		lda #%11111111
		sta PF2       
               
               	SLEEP 13
               

               
                lda #%01110000
                sta PF0
                
                
                lda #$0
                sta COLUPF             ; set the playfield color Black
                
                             
                lda #%00111001
                sta PF1
           
                
                lda #%01110011
                sta PF2
                
                SLEEP 23


               
;-----------------------------------------------------------------------
; LINE 6 A (line 38 according to screen size)

                
                lda #$1E
                sta COLUPF             ; set the playfield color YELLOW
                
                
                lda #%11110000
                sta PF0       

		lda #%11111111
		sta PF1
                

		lda #%11111111
		sta PF2       
               
               	SLEEP 13
               

               
                lda #%11110000
                sta PF0
                
                
                lda #$0
                sta COLUPF             ; set the playfield color Black
                
                             
                lda #%00111001
                sta PF1
           
                
                lda #%11100011
                sta PF2
                
                SLEEP 23


               
;-----------------------------------------------------------------------
; LINE 6 B (line 39 according to screen size)

                
                lda #$1E
                sta COLUPF             ; set the playfield color YELLOW
                
                
                lda #%11110000
                sta PF0       

		lda #%11111111
		sta PF1
                

		lda #%11111111
		sta PF2       
               
               	SLEEP 13
               

               
                lda #%11110000
                sta PF0
                
                
                lda #$0
                sta COLUPF             ; set the playfield color Black
                
                             
                lda #%00111001
                sta PF1
           
                
                lda #%11100011
                sta PF2
                
                SLEEP 23


               
;-----------------------------------------------------------------------
; LINE 6 C (line 40 according to screen size)

                
                lda #$1E
                sta COLUPF             ; set the playfield color YELLOW
                
                
                lda #%11110000
                sta PF0       

		lda #%11111111
		sta PF1
                

		lda #%11111111
		sta PF2       
               
               	SLEEP 13
               

               
                lda #%11110000
                sta PF0
                
                
                lda #$0
                sta COLUPF             ; set the playfield color Black
                
                             
                lda #%00111001
                sta PF1
           
                
                lda #%11100011
                sta PF2
                
                SLEEP 23


               
;-----------------------------------------------------------------------
; LINE 7 A (line 41 according to screen size)

                
                lda #$1E
                sta COLUPF             ; set the playfield color YELLOW
                
                
                lda #%11110000
                sta PF0       

		lda #%11111111
		sta PF1
                

		lda #%11111111
		sta PF2       
               
               	SLEEP 13
               

               
                lda #%11110000
                sta PF0
                
                
                lda #$0
                sta COLUPF             ; set the playfield color Black
                
                             
                lda #%10111001
                sta PF1
           
                
                lda #%11000011
                sta PF2
                
                SLEEP 23


               
;-----------------------------------------------------------------------
; LINE 7 B (line 42 according to screen size)

                
                lda #$1E
                sta COLUPF             ; set the playfield color YELLOW
                
                
                lda #%11110000
                sta PF0       

		lda #%11111111
		sta PF1
                

		lda #%11111111
		sta PF2       
               
               	SLEEP 13
               

               
                lda #%11110000
                sta PF0
                
                
                lda #$0
                sta COLUPF             ; set the playfield color Black
                
                             
                lda #%10111001
                sta PF1
           
                
                lda #%11000011
                sta PF2
                
                SLEEP 23


               
;-----------------------------------------------------------------------
; LINE 7 C (line 43 according to screen size)

                
                lda #$1E
                sta COLUPF             ; set the playfield color YELLOW
                
                
                lda #%11110000
                sta PF0       

		lda #%11111111
		sta PF1
                

		lda #%11111111
		sta PF2       
               
               	SLEEP 13
               

               
                lda #%11110000
                sta PF0
                
                
                lda #$0
                sta COLUPF             ; set the playfield color Black
                
                             
                lda #%10111001
                sta PF1
           
                
                lda #%11000011
                sta PF2
                
                SLEEP 23


               
;-----------------------------------------------------------------------
; LINE 8-1 SPACE (line 44 according to screen size)

                lda #$1E
                sta COLUPF             ; set the playfield color YELLOW
                
                lda #%11110000
                sta PF0       

		
		lda #%11111111
		sta PF1
                

		lda #%11111111
		sta PF2       
		
                SLEEP 13
                
                

                
                lda #%11110000
                sta PF0       
		
                lda #$0E
                sta COLUPF             ; set the playfield color WHITE
                
		lda #%11111111
		sta PF1
                

		lda #%11111111
		sta PF2
                


                SLEEP 23
                
                
;-----------------------------------------------------------------------
; LINE 8-2 SPACE (line 45 according to screen size)

                lda #$1E
                sta COLUPF             ; set the playfield color YELLOW
                
                lda #%11110000
                sta PF0       

		
		lda #%11111111
		sta PF1
                

		lda #%11111111
		sta PF2       
		
                SLEEP 13
                
                

                
                lda #%11110000
                sta PF0       
		
                lda #$0E
                sta COLUPF             ; set the playfield color WHITE
                
		lda #%11111111
		sta PF1
                

		lda #%11111111
		sta PF2
                


                SLEEP 23
                
                
;-----------------------------------------------------------------------
; LINE 8-3 SPACE (line 46 according to screen size)

                lda #$1E
                sta COLUPF             ; set the playfield color YELLOW
                
                lda #%11110000
                sta PF0       

		
		lda #%11111111
		sta PF1
                

		lda #%11111111
		sta PF2       
		
                SLEEP 13
                
                

                
                lda #%11110000
                sta PF0       
		
                lda #$0E
                sta COLUPF             ; set the playfield color WHITE
                
		lda #%11111111
		sta PF1
                

		lda #%11111111
		sta PF2
                


                SLEEP 23
                
                
;-----------------------------------------------------------------------
; LINE 8-4 SPACE (line 47 according to screen size)

                lda #$1E
                sta COLUPF             ; set the playfield color YELLOW
                
                lda #%11110000
                sta PF0       

		
		lda #%11111111
		sta PF1
                

		lda #%11111111
		sta PF2       
		
                SLEEP 13
                
                

                
                lda #%11110000
                sta PF0       
		
                lda #$0E
                sta COLUPF             ; set the playfield color WHITE
                
		lda #%11111111
		sta PF1
                

		lda #%11111111
		sta PF2
                


                SLEEP 23
                
                
;-----------------------------------------------------------------------
; LINE 9 A (line 48 according to screen size)

                
                lda #$1E
                sta COLUPF             ; set the playfield color YELLOW
                
                
                lda #%11110000
                sta PF0       

		lda #%11111111
		sta PF1
                

		lda #%11111111
		sta PF2       
               
               	SLEEP 13
               

               
                lda #%11110000
                sta PF0
                
                
                lda #$0
                sta COLUPF             ; set the playfield color Black
                
                             
                lda #%10111101
                sta PF1
           
                
                lda #%11110111
                sta PF2
                
                SLEEP 23


               
;-----------------------------------------------------------------------
; LINE 9 B (line 49 according to screen size)

                
                lda #$1E
                sta COLUPF             ; set the playfield color YELLOW
                
                
                lda #%11110000
                sta PF0       

		lda #%11111111
		sta PF1
                

		lda #%11111111
		sta PF2       
               
               	SLEEP 13
               

               
                lda #%11110000
                sta PF0
                
                
                lda #$0
                sta COLUPF             ; set the playfield color Black
                
                             
                lda #%10111101
                sta PF1
           
                
                lda #%11110111
                sta PF2
                
                SLEEP 23


               
;-----------------------------------------------------------------------
; LINE 9 C (line 50 according to screen size)

                
                lda #$1E
                sta COLUPF             ; set the playfield color YELLOW
                
                
                lda #%11110000
                sta PF0       

		lda #%11111111
		sta PF1
                

		lda #%11111111
		sta PF2       
               
               	SLEEP 13
               

               
                lda #%11110000
                sta PF0
                
                
                lda #$0
                sta COLUPF             ; set the playfield color Black
                
                             
                lda #%10111101
                sta PF1
           
                
                lda #%11110111
                sta PF2
                
                SLEEP 23


               
;-----------------------------------------------------------------------
; LINE 10 A (line 51 according to screen size)

                
                lda #$1E
                sta COLUPF             ; set the playfield color YELLOW
                
                
                lda #%11110000
                sta PF0       

		lda #%11111111
		sta PF1
                

		lda #%11111111
		sta PF2       
               
               	SLEEP 13
               

               
                lda #%11110000
                sta PF0
                
                
                lda #$0
                sta COLUPF             ; set the playfield color Black
                
                             
                lda #%00111101
                sta PF1
           
                
                lda #%01110111
                sta PF2
                
                SLEEP 23


               
;-----------------------------------------------------------------------
; LINE 10 B (line 52 according to screen size)

                
                lda #$1E
                sta COLUPF             ; set the playfield color YELLOW
                
                
                lda #%11110000
                sta PF0       

		lda #%11111111
		sta PF1
                

		lda #%11111111
		sta PF2       
               
               	SLEEP 13
               

               
                lda #%11110000
                sta PF0
                
                
                lda #$0
                sta COLUPF             ; set the playfield color Black
                
                             
                lda #%00111101
                sta PF1
           
                
                lda #%01110111
                sta PF2
                
                SLEEP 23


               
;-----------------------------------------------------------------------
; LINE 10 C (line 53 according to screen size)

                
                lda #$1E
                sta COLUPF             ; set the playfield color YELLOW
                
                
                lda #%11110000
                sta PF0       

		lda #%11111111
		sta PF1
                

		lda #%11111111
		sta PF2       
               
               	SLEEP 13
               

               
                lda #%11110000
                sta PF0
                
                
                lda #$0
                sta COLUPF             ; set the playfield color Black
                
                             
                lda #%00111101
                sta PF1
           
                
                lda #%01110111
                sta PF2
                
                SLEEP 23


               
;-----------------------------------------------------------------------
; LINE 11 A (line 54 according to screen size)

                
                lda #$1E
                sta COLUPF             ; set the playfield color YELLOW
                
                
                lda #%11110000
                sta PF0       

		lda #%11111111
		sta PF1
                

		lda #%11111111
		sta PF2       
               
               	SLEEP 13
               

               
                lda #%01110000
                sta PF0
                
                
                lda #$0
                sta COLUPF             ; set the playfield color Black
                
                             
                lda #%00111101
                sta PF1
           
                
                lda #%00110111
                sta PF2
                
                SLEEP 23


               
;-----------------------------------------------------------------------
; LINE 11 B (line 55 according to screen size)

                
                lda #$1E
                sta COLUPF             ; set the playfield color YELLOW
                
                
                lda #%11110000
                sta PF0       

		lda #%11111111
		sta PF1
                

		lda #%11111111
		sta PF2       
               
               	SLEEP 13
               

               
                lda #%01110000
                sta PF0
                
                
                lda #$0
                sta COLUPF             ; set the playfield color Black
                
                             
                lda #%00111101
                sta PF1
           
                
                lda #%00110111
                sta PF2
                
                SLEEP 23


               
;-----------------------------------------------------------------------
; LINE 11 C (line 56 according to screen size)

                
                lda #$1E
                sta COLUPF             ; set the playfield color YELLOW
                
                
                lda #%11110000
                sta PF0       

		lda #%11111111
		sta PF1
                

		lda #%11111111
		sta PF2       
               
               	SLEEP 13
               

               
                lda #%01110000
                sta PF0
                
                
                lda #$0
                sta COLUPF             ; set the playfield color Black
                
                             
                lda #%00111101
                sta PF1
           
                
                lda #%00110111
                sta PF2
                
                SLEEP 23


               
;-----------------------------------------------------------------------
; SPACE (line 57 according to screen size)

                lda #$0E
                sta COLUPF             ; set the playfield color WHITE
		
                sta WSYNC
                sta WSYNC
                sta WSYNC
                sta WSYNC

                SLEEP 6
                
                
;-----------------------------------------------------------------------
;**** BEE ON THIRD STRIPE ****
; BEE LINE 1 A (line 61 according to screen size)



		lda #$1E
                sta COLUPF             ; set the playfield color YELLOW
                
                
                lda #%00000000
                sta PF0
                nop
   
		lda #%10000000
                sta PF1
                                
                lda #$0
                sta COLUPF             ; set the playfield color Black
                
                
                
                lda #%11111111
                sta PF2
                
		lda #$1E
                sta COLUPF             ; set the playfield color YELLOW
                
                lda #%11110000
                sta PF0
                
		lda #%11111111
                sta PF1
                
                
                SLEEP 34

;-----------------------------------------------------------------------
; BEE LINE 1 B (line 62 according to screen size)



		lda #$1E
                sta COLUPF             ; set the playfield color YELLOW
                
                
                lda #%00000000
                sta PF0
                nop
   
		lda #%10000000
                sta PF1
                                
                lda #$0
                sta COLUPF             ; set the playfield color Black
                
                
                
                lda #%11111111
                sta PF2
                
		lda #$1E
                sta COLUPF             ; set the playfield color YELLOW
                
                lda #%11110000
                sta PF0
                
		lda #%11111111
                sta PF1
                
                
                SLEEP 34

;-----------------------------------------------------------------------
; BEE LINE 2 A (line 63 according to screen size)



		lda #$1E
                sta COLUPF             ; set the playfield color YELLOW
                
                
                lda #%00000000
                sta PF0
                nop
   
		lda #%11000000
                sta PF1
                                
                lda #$0
                sta COLUPF             ; set the playfield color Black
                
                
                
                lda #%11111111
                sta PF2
                
		lda #$1E
                sta COLUPF             ; set the playfield color YELLOW
                
                lda #%11110000
                sta PF0
                
		lda #%11111111
                sta PF1
                
                
                SLEEP 34

;-----------------------------------------------------------------------
; BEE LINE 2 B (line 64 according to screen size)



		lda #$1E
                sta COLUPF             ; set the playfield color YELLOW
                
                
                lda #%00000000
                sta PF0
                nop
   
		lda #%11000000
                sta PF1
                                
                lda #$0
                sta COLUPF             ; set the playfield color Black
                
                
                
                lda #%11111111
                sta PF2
                
		lda #$1E
                sta COLUPF             ; set the playfield color YELLOW
                
                lda #%11110000
                sta PF0
                
		lda #%11111111
                sta PF1
                
                
                SLEEP 34

;-----------------------------------------------------------------------
; BEE LINE 3 A (line 65 according to screen size)



		lda #$1E
                sta COLUPF             ; set the playfield color YELLOW
                
                
                lda #%00000000
                sta PF0
                nop
   
		lda #%11100000
                sta PF1
                                
                lda #$0
                sta COLUPF             ; set the playfield color Black
                
                
                
                lda #%11111111
                sta PF2
                
		lda #$1E
                sta COLUPF             ; set the playfield color YELLOW
                
                lda #%11110000
                sta PF0
                
		lda #%11111111
                sta PF1
                
                
                SLEEP 34

;-----------------------------------------------------------------------
; BEE LINE 3 B (line 66 according to screen size)



		lda #$1E
                sta COLUPF             ; set the playfield color YELLOW
                
                
                lda #%00000000
                sta PF0
                nop
   
		lda #%11100000
                sta PF1
                                
                lda #$0
                sta COLUPF             ; set the playfield color Black
                
                
                
                lda #%11111111
                sta PF2
                
		lda #$1E
                sta COLUPF             ; set the playfield color YELLOW
                
                lda #%11110000
                sta PF0
                
		lda #%11111111
                sta PF1
                
                
                SLEEP 34

;-----------------------------------------------------------------------
; BEE LINE 4 A (line 67 according to screen size)



		lda #$1E
                sta COLUPF             ; set the playfield color YELLOW
                
                
                lda #%10000000
                sta PF0
                nop
   
		lda #%00000000
                sta PF1
                                
                lda #$0
                sta COLUPF             ; set the playfield color Black
                
                
                
                lda #%11111111
                sta PF2
                
		lda #$1E
                sta COLUPF             ; set the playfield color YELLOW
                
                lda #%11110000
                sta PF0
                
		lda #%11111111
                sta PF1
                
                
                SLEEP 34

;-----------------------------------------------------------------------
; BEE LINE 4 B (line 68 according to screen size)



		lda #$1E
                sta COLUPF             ; set the playfield color YELLOW
                
                
                lda #%10000000
                sta PF0
                nop
   
		lda #%00000000
                sta PF1
                                
                lda #$0
                sta COLUPF             ; set the playfield color Black
                
                
                
                lda #%11111111
                sta PF2
                
		lda #$1E
                sta COLUPF             ; set the playfield color YELLOW
                
                lda #%11110000
                sta PF0
                
		lda #%11111111
                sta PF1
                
                
                SLEEP 34

;-----------------------------------------------------------------------
; BEE LINE 5 A (line 69 according to screen size)



		lda #$1E
                sta COLUPF             ; set the playfield color YELLOW
                
                
                lda #%10000000
                sta PF0
                nop
   
		lda #%11000000
                sta PF1
                                
                lda #$0
                sta COLUPF             ; set the playfield color Black
                
                
                
                lda #%11111111
                sta PF2
                
		lda #$1E
                sta COLUPF             ; set the playfield color YELLOW
                
                lda #%11110000
                sta PF0
                
		lda #%11111111
                sta PF1
                
                
                SLEEP 34

;-----------------------------------------------------------------------
; BEE LINE 5 B (line 70 according to screen size)



		lda #$1E
                sta COLUPF             ; set the playfield color YELLOW
                
                
                lda #%10000000
                sta PF0
                nop
   
		lda #%11000000
                sta PF1
                                
                lda #$0
                sta COLUPF             ; set the playfield color Black
                
                
                
                lda #%11111111
                sta PF2
                
		lda #$1E
                sta COLUPF             ; set the playfield color YELLOW
                
                lda #%11110000
                sta PF0
                
		lda #%11111111
                sta PF1
                
                
                SLEEP 34

;-----------------------------------------------------------------------
; BEE LINE 6 A (line 71 according to screen size)



		lda #$1E
                sta COLUPF             ; set the playfield color YELLOW
                
                
                lda #%10000000
                sta PF0
                nop
   
		lda #%11100000
                sta PF1
                                
                lda #$0
                sta COLUPF             ; set the playfield color Black
                
                
                
                lda #%11111111
                sta PF2
                
		lda #$1E
                sta COLUPF             ; set the playfield color YELLOW
                
                lda #%11110000
                sta PF0
                
		lda #%11111111
                sta PF1
                
                
                SLEEP 34

;-----------------------------------------------------------------------
; BEE LINE 6 B (line 72 according to screen size)



		lda #$1E
                sta COLUPF             ; set the playfield color YELLOW
                
                
                lda #%10000000
                sta PF0
                nop
   
		lda #%11100000
                sta PF1
                                
                lda #$0
                sta COLUPF             ; set the playfield color Black
                
                
                
                lda #%11111111
                sta PF2
                
		lda #$1E
                sta COLUPF             ; set the playfield color YELLOW
                
                lda #%11110000
                sta PF0
                
		lda #%11111111
                sta PF1
                
                
                SLEEP 34

;-----------------------------------------------------------------------
; BEE LINE 7 A (line 73 according to screen size)



		lda #$1E
                sta COLUPF             ; set the playfield color YELLOW
                
                
                lda #%11000000
                sta PF0
                nop
   
		lda #%11110000
                sta PF1
                                
                lda #$0
                sta COLUPF             ; set the playfield color Black
                
                
                
                lda #%11111111
                sta PF2
                
		lda #$1E
                sta COLUPF             ; set the playfield color YELLOW
                
                lda #%11110000
                sta PF0
                
		lda #%11111111
                sta PF1
                
                
                SLEEP 34

;-----------------------------------------------------------------------
; BEE LINE 7 B (line 74 according to screen size)



		lda #$1E
                sta COLUPF             ; set the playfield color YELLOW
                
                
                lda #%11000000
                sta PF0
                nop
   
		lda #%11110000
                sta PF1
                                
                lda #$0
                sta COLUPF             ; set the playfield color Black
                
                
                
                lda #%11111111
                sta PF2
                
		lda #$1E
                sta COLUPF             ; set the playfield color YELLOW
                
                lda #%11110000
                sta PF0
                
		lda #%11111111
                sta PF1
                
                
                SLEEP 34

;-----------------------------------------------------------------------
; BEE LINE 8 A (line 75 according to screen size)



		lda #$1E
                sta COLUPF             ; set the playfield color YELLOW
                
                
                lda #%11000000
                sta PF0
                nop
   
		lda #%00000000
                sta PF1
                                
                lda #$0
                sta COLUPF             ; set the playfield color Black
                
                
                
                lda #%11111111
                sta PF2
                
		lda #$1E
                sta COLUPF             ; set the playfield color YELLOW
                
                lda #%11110000
                sta PF0
                
		lda #%11111111
                sta PF1
                
                
                SLEEP 34

;-----------------------------------------------------------------------
; BEE LINE 8 B (line 76 according to screen size)



		lda #$1E
                sta COLUPF             ; set the playfield color YELLOW
                
                
                lda #%11000000
                sta PF0
                nop
   
		lda #%00000000
                sta PF1
                                
                lda #$0
                sta COLUPF             ; set the playfield color Black
                
                
                
                lda #%11111111
                sta PF2
                
		lda #$1E
                sta COLUPF             ; set the playfield color YELLOW
                
                lda #%11110000
                sta PF0
                
		lda #%11111111
                sta PF1
                
                
                SLEEP 34

;-----------------------------------------------------------------------
; BEE LINE 9 A (line 77 according to screen size)



		lda #$1E
                sta COLUPF             ; set the playfield color YELLOW
                
                
                lda #%11000000
                sta PF0
                nop
   
		lda #%11110000
                sta PF1
                                
                lda #$0
                sta COLUPF             ; set the playfield color Black
                
                
                
                lda #%11111111
                sta PF2
                
		lda #$1E
                sta COLUPF             ; set the playfield color YELLOW
                
                lda #%11110000
                sta PF0
                
		lda #%11111111
                sta PF1
                
                
                SLEEP 34

;-----------------------------------------------------------------------
; BEE LINE 9 B (line 78 according to screen size)



		lda #$1E
                sta COLUPF             ; set the playfield color YELLOW
                
                
                lda #%11000000
                sta PF0
                nop
   
		lda #%11110000
                sta PF1
                                
                lda #$0
                sta COLUPF             ; set the playfield color Black
                
                
                
                lda #%11111111
                sta PF2
                
		lda #$1E
                sta COLUPF             ; set the playfield color YELLOW
                
                lda #%11110000
                sta PF0
                
		lda #%11111111
                sta PF1
                
                
                SLEEP 34

;-----------------------------------------------------------------------
; BEE LINE 10 A (line 79 according to screen size)



		lda #$1E
                sta COLUPF             ; set the playfield color YELLOW
                
                
                lda #%11000000
                sta PF0
                nop
   
		lda #%11100000
                sta PF1
                                
                lda #$0
                sta COLUPF             ; set the playfield color Black
                
                
                
                lda #%11111111
                sta PF2
                
		lda #$1E
                sta COLUPF             ; set the playfield color YELLOW
                
                lda #%11110000
                sta PF0
                
		lda #%11111111
                sta PF1
                
                
                SLEEP 34

;-----------------------------------------------------------------------
; BEE LINE 10 B (line 80 according to screen size)



		lda #$1E
                sta COLUPF             ; set the playfield color YELLOW
                
                
                lda #%11000000
                sta PF0
                nop
   
		lda #%11100000
                sta PF1
                                
                lda #$0
                sta COLUPF             ; set the playfield color Black
                
                
                
                lda #%11111111
                sta PF2
                
		lda #$1E
                sta COLUPF             ; set the playfield color YELLOW
                
                lda #%11110000
                sta PF0
                
		lda #%11111111
                sta PF1
                
                
                SLEEP 34

;-----------------------------------------------------------------------
; BEE LINE 11 A (line 81 according to screen size)



		lda #$1E
                sta COLUPF             ; set the playfield color YELLOW
                
                
                lda #%10000000
                sta PF0
                nop
   
		lda #%11000000
                sta PF1
                                
                lda #$0
                sta COLUPF             ; set the playfield color Black
                
                
                
                lda #%11111111
                sta PF2
                
		lda #$1E
                sta COLUPF             ; set the playfield color YELLOW
                
                lda #%11110000
                sta PF0
                
		lda #%11111111
                sta PF1
                
                
                SLEEP 34

;-----------------------------------------------------------------------
; BEE LINE 11 B (line 82 according to screen size)



		lda #$1E
                sta COLUPF             ; set the playfield color YELLOW
                
                
                lda #%10000000
                sta PF0
                nop
   
		lda #%11000000
                sta PF1
                                
                lda #$0
                sta COLUPF             ; set the playfield color Black
                
                
                
                lda #%11111111
                sta PF2
                
		lda #$1E
                sta COLUPF             ; set the playfield color YELLOW
                
                lda #%11110000
                sta PF0
                
		lda #%11111111
                sta PF1
                
                
                SLEEP 34

;-----------------------------------------------------------------------
                
                
;-----------------------------------------------
;Blank Space in the rest of screen


		ldx #0

		lda #0         ; PF0 is mirrored <--- direction, low 4 bits ignored

                
                sta PF0

                sta PF1

                sta PF2




RestsOFcreen      sta WSYNC

                inx

                cpx #110

                bne RestsOFcreen



      


       ;------------------------------------------------
	; Start of Overscan processing


 

                lda #%00000010		; turn on the beam

                sta VBLANK          ; end of screen - enter blanking


                REPEAT 30
        		sta WSYNC	; 30 scanlines of overscan. . .
		REPEND

				
		
                lda #%00000000		; turn off the beam

                sta VBLANK          ; end of screen - enter blanking
                
       ;------------------------------------------------
				

                jmp StartOfFrame




;------------------------------------------------------------------------------



            ORG $FFFA



InterruptVectors
           

            .word Reset          ; NMI
	
           
            .word Reset          ; RESET

          
            .word Reset          ; IRQ



      END