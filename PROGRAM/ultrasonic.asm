
_config:

;ultrasonic.c,22 :: 		void config ()
;ultrasonic.c,24 :: 		ADCON1=0b00001111;                //CONVERT ANALOG TO DIGITAL FOR LAST 4 PINS
	MOVLW       15
	MOVWF       ADCON1+0 
;ultrasonic.c,26 :: 		TRISC.F3=0;                       //TRIGER AS OUTPUT
	BCF         TRISC+0, 3 
;ultrasonic.c,27 :: 		TRISB.F5=1;                       //ECHO AS INPUT
	BSF         TRISB+0, 5 
;ultrasonic.c,28 :: 		TRISD.F0=0;                       //LED1 AS OUTPUT
	BCF         TRISD+0, 0 
;ultrasonic.c,29 :: 		TRISD.F1=0;                       //LED2 AS OUTPUT
	BCF         TRISD+0, 1 
;ultrasonic.c,30 :: 		TRISE.F3=1;                       //LCMR (RESET PIC) AS INPUT
	BSF         TRISE+0, 3 
;ultrasonic.c,32 :: 		Lcd_Init();                        // Initialize LCD
	CALL        _Lcd_Init+0, 0
;ultrasonic.c,33 :: 		Lcd_Cmd(_LCD_CLEAR);               // Clear display
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;ultrasonic.c,34 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;ultrasonic.c,35 :: 		Lcd_Out(1,1,"welcome");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_ultrasonic+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_ultrasonic+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ultrasonic.c,36 :: 		delay_ms(1000);
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_config0:
	DECFSZ      R13, 1, 1
	BRA         L_config0
	DECFSZ      R12, 1, 1
	BRA         L_config0
	DECFSZ      R11, 1, 1
	BRA         L_config0
	NOP
	NOP
;ultrasonic.c,37 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;ultrasonic.c,38 :: 		Lcd_Out(1,1,"ultrasonic");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr2_ultrasonic+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr2_ultrasonic+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ultrasonic.c,39 :: 		delay_ms(1000);
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_config1:
	DECFSZ      R13, 1, 1
	BRA         L_config1
	DECFSZ      R12, 1, 1
	BRA         L_config1
	DECFSZ      R11, 1, 1
	BRA         L_config1
	NOP
	NOP
;ultrasonic.c,40 :: 		PORTD.F0=1;
	BSF         PORTD+0, 0 
;ultrasonic.c,41 :: 		PORTD.F1=1;
	BSF         PORTD+0, 1 
;ultrasonic.c,42 :: 		delay_ms(1000);
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_config2:
	DECFSZ      R13, 1, 1
	BRA         L_config2
	DECFSZ      R12, 1, 1
	BRA         L_config2
	DECFSZ      R11, 1, 1
	BRA         L_config2
	NOP
	NOP
;ultrasonic.c,43 :: 		PORTD.F0=0;
	BCF         PORTD+0, 0 
;ultrasonic.c,44 :: 		PORTD.F1=0;
	BCF         PORTD+0, 1 
;ultrasonic.c,45 :: 		delay_ms(1000);
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_config3:
	DECFSZ      R13, 1, 1
	BRA         L_config3
	DECFSZ      R12, 1, 1
	BRA         L_config3
	DECFSZ      R11, 1, 1
	BRA         L_config3
	NOP
	NOP
;ultrasonic.c,46 :: 		delay_ms(1);
	MOVLW       3
	MOVWF       R12, 0
	MOVLW       151
	MOVWF       R13, 0
L_config4:
	DECFSZ      R13, 1, 1
	BRA         L_config4
	DECFSZ      R12, 1, 1
	BRA         L_config4
	NOP
	NOP
;ultrasonic.c,48 :: 		T1CON=0b00000000;                         //RESET TIMER1
	CLRF        T1CON+0 
;ultrasonic.c,49 :: 		}
L_end_config:
	RETURN      0
; end of _config

_get_distsnce:

;ultrasonic.c,51 :: 		void get_distsnce()
;ultrasonic.c,53 :: 		TMR1H=0;            //RESET TIMER1 4BYTES FOR HGH EDGE
	CLRF        TMR1H+0 
;ultrasonic.c,54 :: 		TMR1L=0;            //RESET TIMER1 4BYTES FOR LOW
	CLRF        TMR1L+0 
;ultrasonic.c,55 :: 		PORTC.F3=1;
	BSF         PORTC+0, 3 
;ultrasonic.c,56 :: 		delay_us(10);
	MOVLW       6
	MOVWF       R13, 0
L_get_distsnce5:
	DECFSZ      R13, 1, 1
	BRA         L_get_distsnce5
	NOP
;ultrasonic.c,57 :: 		PORTC.F3=0;
	BCF         PORTC+0, 3 
;ultrasonic.c,58 :: 		while (PORTB.F5==0);
L_get_distsnce6:
	BTFSC       PORTB+0, 5 
	GOTO        L_get_distsnce7
	GOTO        L_get_distsnce6
L_get_distsnce7:
;ultrasonic.c,59 :: 		TMR1ON_BIT=1;
	BSF         TMR1ON_bit+0, 0 
;ultrasonic.c,60 :: 		while (PORTB.F5==1);
L_get_distsnce8:
	BTFSS       PORTB+0, 5 
	GOTO        L_get_distsnce9
	GOTO        L_get_distsnce8
L_get_distsnce9:
;ultrasonic.c,61 :: 		TMR1ON_BIT=0;
	BCF         TMR1ON_bit+0, 0 
;ultrasonic.c,63 :: 		time=((TMR1H << 8)+TMR1L);
	MOVF        TMR1H+0, 0 
	MOVWF       R1 
	CLRF        R0 
	MOVF        TMR1L+0, 0 
	ADDWF       R0, 1 
	MOVLW       0
	ADDWFC      R1, 1 
	MOVF        R0, 0 
	MOVWF       _time+0 
	MOVF        R1, 0 
	MOVWF       _time+1 
;ultrasonic.c,65 :: 		distance=(time/58)/2;
	MOVLW       58
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Div_16x16_U+0, 0
	MOVF        R0, 0 
	MOVWF       _distance+0 
	MOVF        R1, 0 
	MOVWF       _distance+1 
	RRCF        _distance+1, 1 
	RRCF        _distance+0, 1 
	BCF         _distance+1, 7 
;ultrasonic.c,67 :: 		wordtostr(time,time_txt);
	MOVF        _time+0, 0 
	MOVWF       FARG_WordToStr_input+0 
	MOVF        _time+1, 0 
	MOVWF       FARG_WordToStr_input+1 
	MOVLW       _time_txt+0
	MOVWF       FARG_WordToStr_output+0 
	MOVLW       hi_addr(_time_txt+0)
	MOVWF       FARG_WordToStr_output+1 
	CALL        _WordToStr+0, 0
;ultrasonic.c,68 :: 		wordtostr(distance,distance_txt);
	MOVF        _distance+0, 0 
	MOVWF       FARG_WordToStr_input+0 
	MOVF        _distance+1, 0 
	MOVWF       FARG_WordToStr_input+1 
	MOVLW       _distance_txt+0
	MOVWF       FARG_WordToStr_output+0 
	MOVLW       hi_addr(_distance_txt+0)
	MOVWF       FARG_WordToStr_output+1 
	CALL        _WordToStr+0, 0
;ultrasonic.c,70 :: 		Ltrim(time_txt);
	MOVLW       _time_txt+0
	MOVWF       FARG_Ltrim_string+0 
	MOVLW       hi_addr(_time_txt+0)
	MOVWF       FARG_Ltrim_string+1 
	CALL        _Ltrim+0, 0
;ultrasonic.c,71 :: 		Ltrim(distance_txt);
	MOVLW       _distance_txt+0
	MOVWF       FARG_Ltrim_string+0 
	MOVLW       hi_addr(_distance_txt+0)
	MOVWF       FARG_Ltrim_string+1 
	CALL        _Ltrim+0, 0
;ultrasonic.c,73 :: 		if(distance>=10 && distance<=400)
	MOVLW       0
	SUBWF       _distance+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__get_distsnce23
	MOVLW       10
	SUBWF       _distance+0, 0 
L__get_distsnce23:
	BTFSS       STATUS+0, 0 
	GOTO        L_get_distsnce12
	MOVF        _distance+1, 0 
	SUBLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L__get_distsnce24
	MOVF        _distance+0, 0 
	SUBLW       144
L__get_distsnce24:
	BTFSS       STATUS+0, 0 
	GOTO        L_get_distsnce12
L__get_distsnce20:
;ultrasonic.c,75 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;ultrasonic.c,76 :: 		Lcd_Out(2,1,"time=");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr3_ultrasonic+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr3_ultrasonic+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ultrasonic.c,77 :: 		Lcd_Out(2,1,"distance=");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr4_ultrasonic+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr4_ultrasonic+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ultrasonic.c,78 :: 		Lcd_Out(2,6,time_txt);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       6
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _time_txt+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_time_txt+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ultrasonic.c,79 :: 		Lcd_Out(2,11,distance_txt);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       11
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _distance_txt+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_distance_txt+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ultrasonic.c,80 :: 		}
	GOTO        L_get_distsnce13
L_get_distsnce12:
;ultrasonic.c,83 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;ultrasonic.c,85 :: 		PORTD.F0=0;
	BCF         PORTD+0, 0 
;ultrasonic.c,86 :: 		while(1)
L_get_distsnce14:
;ultrasonic.c,88 :: 		Lcd_Out(3,3,"OUT OF RANGE!!!");
	MOVLW       3
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       3
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr5_ultrasonic+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr5_ultrasonic+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ultrasonic.c,89 :: 		PORTD.F1=1;
	BSF         PORTD+0, 1 
;ultrasonic.c,90 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_get_distsnce16:
	DECFSZ      R13, 1, 1
	BRA         L_get_distsnce16
	DECFSZ      R12, 1, 1
	BRA         L_get_distsnce16
	DECFSZ      R11, 1, 1
	BRA         L_get_distsnce16
	NOP
;ultrasonic.c,91 :: 		Lcd_Out(3,3,"               ");
	MOVLW       3
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       3
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr6_ultrasonic+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr6_ultrasonic+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ultrasonic.c,92 :: 		PORTD.F1=0;
	BCF         PORTD+0, 1 
;ultrasonic.c,93 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_get_distsnce17:
	DECFSZ      R13, 1, 1
	BRA         L_get_distsnce17
	DECFSZ      R12, 1, 1
	BRA         L_get_distsnce17
	DECFSZ      R11, 1, 1
	BRA         L_get_distsnce17
	NOP
;ultrasonic.c,94 :: 		}
	GOTO        L_get_distsnce14
;ultrasonic.c,95 :: 		}
L_get_distsnce13:
;ultrasonic.c,97 :: 		}
L_end_get_distsnce:
	RETURN      0
; end of _get_distsnce

_main:

;ultrasonic.c,99 :: 		void main() {
;ultrasonic.c,100 :: 		config();
	CALL        _config+0, 0
;ultrasonic.c,101 :: 		while (1)
L_main18:
;ultrasonic.c,103 :: 		get_distsnce();
	CALL        _get_distsnce+0, 0
;ultrasonic.c,104 :: 		}
	GOTO        L_main18
;ultrasonic.c,105 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
