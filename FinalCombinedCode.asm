#team B

#$s0 = Open
#$s1 = Open
#$s2 = cur
#$s3 = liveNeighbours
#$s4 = rowSize
#$s5 = maxSize
#$s6 = offset
#$s7 = curTemp
#Matrix = display matrix
#Matrix2 = update matrix


.data 
	#allocating a 4 bits per integer and storing 32x32 integers
	#Making a 32x32 matrix
	Matrix: .space 4096		#display matrix
	Matrix2: .space 4096		#update matrix

	#allows for terminal display
	newline: .asciiz "\n"
	dash: .asciiz "-"
	
	#used for display
	screen:	.word 0x10000000
	pixel:	.word 1024 # 32*32 since our display is 512x512 with pixels of 16X16
	white: .word 0xffffffff
	black: .word 0x00000000
	
	red: .word 0xb40000
    	orange: .word 0xc50000
    	yellow: .word 0xdc0808
    	green: .word 0xf11919
    	blue: .word 0xff4949
    	purp: .word 0xff8181
	vi: .word 0xffb6b6
	rowSize:   .word  32 #the row size of the matrix


.text	
    #having our 2 indicators to be loaded in
    #dead cell
    addi     $t6, $zero, 0
    #alive cell
    addi     $t7, $zero, 5
    
    #indexer is $t1
    addi     $t1, $zero, 0
	li 	$s2, 0 			#currentCell=0
	li 	$s3, 0			#numLiveCells=0
	lw 	$s4,rowSize 		#load rowSize into s4
	mult	$s4, $s4		#multiply rowSize by rowSize
	mflo	$s5			#puts MaxSize(rowSize x rowSize) into $s5, 
	li 	$s6, 0  		# offset
    	addi	$s1, $s5, 0		
    	sll	$s1, $s5, 2		
    	
    j    Pattren2    
    #loops through the array setting values to make a blinker
    Pattren1:
        #If the index has reached the end or the array stop
        beq     $t1, 4096, ResetPrinterIndex
    
        #sets the value to $t7
        sw     $t6, Matrix($t1)
        
        
        beq     $t1, 136, addAlive1
        beq    $t1, 264, addAlive1
        beq     $t1, 392, addAlive1
            
        #indexing by 4 bits
        addi     $t1, $t1, 4
        
        #repeat the looper
        j     Pattren1
    
    #loops through the array setting values to make a glider
    Pattren2:
        #If the index has reached the end or the array stop
        beq     $t1, 4096, ResetPrinterIndex
    
        #sets the value to $t7
        sw     $t6, Matrix($t1)
        
        
        beq     $t1, 136, addAlive2
        beq    $t1, 268, addAlive2
        beq     $t1, 388, addAlive2
        beq     $t1, 392, addAlive2
        beq     $t1, 396, addAlive2
        
        #indexing by 4 bits
        addi     $t1, $t1, 4
        
        #repeat the looper
        j     Pattren2
        
    #loops through the array setting values to make a masive blinker
    Pattren3:   
 
        #If the index has reached the end or the array stop
        beq     $t1, 4096, ResetPrinterIndex
    
        #sets the value to $t7
        sw     $t6, Matrix($t1)
        
        beq    $t1, 388, addAlive3
        beq    $t1, 392, addAlive3
        beq    $t1, 396, addAlive3
        beq    $t1, 268, addAlive3
        beq     $t1, 140, addAlive3
        beq     $t1, 144, addAlive3
        beq     $t1, 148, addAlive3
        beq     $t1, 152, addAlive3
        beq     $t1, 280, addAlive3
        beq     $t1, 408, addAlive3
        beq     $t1, 412, addAlive3
        beq     $t1, 416, addAlive3
        beq     $t1, 288, addAlive3
        beq     $t1, 160, addAlive3
        beq     $t1, 164, addAlive3
        beq     $t1, 168, addAlive3
        beq     $t1, 172, addAlive3
        beq     $t1, 160, addAlive3
        beq     $t1, 160, addAlive3
        beq     $t1, 300, addAlive3
        beq     $t1, 428, addAlive3
        beq     $t1, 432, addAlive3
        beq     $t1, 436, addAlive3
        beq    $t1, 564, addAlive3
        beq    $t1, 692, addAlive3
        beq    $t1, 820, addAlive3
        beq    $t1, 816, addAlive3
        beq    $t1, 812, addAlive3
        beq    $t1, 940, addAlive3
        beq    $t1, 1068, addAlive3
        beq    $t1, 1072, addAlive3
        beq    $t1, 1076, addAlive3
        beq    $t1, 1204, addAlive3
        beq    $t1, 1332, addAlive3
        beq    $t1, 1460, addAlive3
        beq    $t1, 1456, addAlive3
        beq    $t1, 1452, addAlive3
        beq    $t1, 1580, addAlive3
        beq    $t1, 1708, addAlive3
        beq    $t1, 1704, addAlive3
        beq    $t1, 1700, addAlive3
        beq    $t1, 1696, addAlive3
        beq    $t1, 1568, addAlive3
        beq    $t1, 1440, addAlive3
        beq    $t1, 1436, addAlive3
        beq    $t1, 1432, addAlive3
        beq    $t1, 1436, addAlive3
        beq    $t1, 1560, addAlive3
        beq    $t1, 1688, addAlive3
        beq    $t1, 1684, addAlive3
        beq    $t1, 1680, addAlive3
        beq    $t1, 1676, addAlive3
        beq    $t1, 1548, addAlive3
        beq    $t1, 1420, addAlive3
        beq    $t1, 1416, addAlive3
        beq    $t1, 1412, addAlive3
        beq    $t1, 1284, addAlive3
        beq    $t1, 1156, addAlive3
        beq    $t1, 1028, addAlive3
        beq    $t1, 1032, addAlive3
        beq    $t1, 1036, addAlive3
        beq    $t1, 908, addAlive3
        beq    $t1, 780, addAlive3
        beq    $t1, 776, addAlive3
        beq    $t1, 772, addAlive3
        beq    $t1, 644, addAlive3
        beq    $t1, 516, addAlive3
        
        
        #indexing by 4 bits
        addi     $t1, $t1, 4
        
        #repeat the looper
        j     Pattren3
        
          #loops through the array setting values to make a glider
    Pattren4:
        #If the index has reached the end or the array stop
        beq     $t1, 4096, ResetPrinterIndex
    
        #sets the value to $t6
        sw     $t6, Matrix($t1)
        
        
        beq     $t1, 2004, addAlive4
        beq    $t1, 2140, addAlive4
        beq     $t1, 2256, addAlive4
        beq     $t1, 2260, addAlive4
        beq     $t1, 2272, addAlive4
        beq     $t1, 2276, addAlive4
        beq     $t1, 2280, addAlive4
        
        #indexing by 4 bits
        addi     $t1, $t1, 4
        
        #repeat the looper
        j     Pattren4

PattrenR:	
	beq	$t1, 4096, ResetPrinterIndex
	sw	$t6, Matrix($t1)
		
	
	#random number generator
	li 	$a1, 2
	li	$v0, 42
	add 	$a0, $a0, 1 
	syscall
	
	beq	$a0, 1 addAliveR
	
	addi $t1, $t1, 4
	
	
	j	PattrenR	 	
                
    #sets one point as alive for a pattren    
    addAlive1:
        sw     $t7, Matrix($t1)
        addi     $t1, $t1, 4
        j Pattren1
    
    #sets one point as alive for a pattren    
    addAlive2:
        sw     $t7, Matrix($t1)
        addi     $t1, $t1, 4
        j Pattren2
        
    #sets one point as alive for a pattren    
    addAlive3:
        sw     $t7, Matrix($t1)
        addi     $t1, $t1, 4
        j Pattren3
        
     #sets one point as alive for a pattren    
    addAlive4:
        sw     $t7, Matrix($t1)
        addi     $t1, $t1, 4
        j Pattren4
        
            
     #sets one point as alive for a pattren    
    addAliveR:
        sw     $t7, Matrix($t1)
        addi     $t1, $t1, 4
        j PattrenR


#For checkCell: sets base cases
	li 	$s2, 0 			#currentCell=0
	li 	$s3, 0			#numLiveCells=0
	lw 	$s4,rowSize 		#load rowSize into s4
	mult	$s4, $s4		#multiply rowSize by rowSize
	mflo	$s5			#puts MaxSize(rowSize x rowSize) into $s5, 
	div  	$s2, $s4		# divdes current cell by rowsize, and puts remainder in HI	
	mfhi 	$t4			# Sets remainder in t4
	add 	$t5, $s4, -1	 	# Sets t5 to rowSize -1


StartMain:
	jal BitPrinterSetUp 		#print out the dislay Matrix
Rrules:	li $s2, 0			#reset the current location to 0
	j Rules			#Update the second matrix, and swap second matrix to be the display matrix
	#j StartMain			#Loop for eternity 


	
	#for now is only used by the print function
	ResetPrinterIndex:
		addi 	$t1, $zero, 0
		j 	Printer
		
	#starts the counsoul output on a new line	
	NewLine:
		li 	$v0, 4       		# you can call it your way as well with addi 
		la 	$a0, newline       	# load address of the string
		syscall
		j 	Printer
	
	#loops thorugh 32x32 matrix and prints the values
	Printer:
		#If the index has reached the end or the array stop the program
		beq $t1, 4096, Line
		#loads the value in Martrix($t1)
		lw $t6, Matrix($t1)	
		
		#shifts the index
		addi $t1, $t1, 4
		
		#prints the value
		li $v0, 1 
		addi $a0, $t6, 0
		syscall
		
		#start on new line if it is at end of "row"
		#start on new line if it is at end of "row"
        li $t6, 128
        div   $t1, $t6
        mfhi $t7
        beq     $t7, 0, NewLine
		j 	Printer
	

Line:
		add	$t1, $zero, $zero
	innerLine:li 	$v0, 4       # you can call it your way as well with addi 
		la 	$a0, dash        # load address of the string
		syscall
		addi	$t1, $t1, 1
		bne	$t1, 32, innerLine
		li 	$v0, 4       # you can call it your way as well with addi 
		la 	$a0, newline       # load address of the string
		syscall
		j BitPrinterSetUp




















	#sets up the bit map printer
	BitPrinterSetUp:

	addi $t3, $zero, 0 #iterator through the matrix
		j BitPrinter
	
	    BitPrinter:
	#stops the program untill user gives input
    	#addi $v0, $0 , 5  
     	#syscall     #get input        move    $t0 , $v0              	# save input in $t0
      	#addi    $t1, $zero, 0           				#move 0 in
       	#beq     $t0, $t1, exit            				#check if 0 was inputed

        lw     $t0, screen
        lw    $t1, pixel
        lw     $t6, Matrix($t3)
        bge     $t6, 1, BitPrintAlive
        beq     $t6, 0, BitPrintDead
        
    #sets pixel to white
    BitPrintAlive:
        beq     $t6, 1, RED
        beq     $t6, 2, ORANGE
        beq     $t6, 3, YELLOW
        beq     $t6, 4, GREEN
        beq     $t6, 5, BLUE
        beq     $t6, 7, PURP
        beq     $t6, 8, VI
        beq     $t6, 9, WHITE    
    RED:
        lw    $t2, red
        j     CONTINUEPRINT
    ORANGE:
        lw    $t2, orange
        j     CONTINUEPRINT
    YELLOW:
        lw    $t2, yellow
        j     CONTINUEPRINT
    GREEN:
        lw    $t2, green
        j     CONTINUEPRINT
    BLUE:
        lw    $t2, blue
        j     CONTINUEPRINT
    PURP:
        lw    $t2, purp
        j     CONTINUEPRINT
    VI:
        lw    $t2, vi
        j     CONTINUEPRINT
    WHITE:        
        lw    $t2, white    
    CONTINUEPRINT:        sw    $t2,($t0)
        addi     $t0, $t0, 4
        addi    $t3, $t3, 4
        subi    $t1,$t1, 1
        beq     $t3, 4096, Rrules
        lw     $t6, Matrix($t3)
        bge    $t6, 1, BitPrintAlive
        beq     $t6, 0, BitPrintDead
    
    #sets pixel to black
    BitPrintDead:
        lw    $t2, black
        sw    $t2,($t0)
        addi     $t0, $t0, 4
        addi    $t3, $t3, 4
        subi    $t1,$t1, 1
        beq     $t3, 4096, Rrules
        lw     $t6, Matrix($t3)
        bge    $t6, 1, BitPrintAlive
        beq     $t6, 0, BitPrintDead






	
CheckCells:
	li	$s3, 0			#resets the value of numLiveCells
checkMidLeftCurrentCell:	
	li	$t1, 0			# resets t1
	li 	$s6, 0  		# Sets offset value
	div  	$s2, $s4		# divdes current cell by rowsize, and puts remainder in HI	
	mfhi 	$t4			# Sets remainder in t4
	beq 	$t4, 0, MLLeft 		# Checks if on left bound

	j	MLContinue

	
MLLeft:
	add 	$s6, $s6, $s4           # adds rowsize to s6(offset value)
	j	MLContinue		# continue
	
MLContinue:			
	addi	$t1, $s2, -1		# t1 = CurrentCell -1
	add	$t1, $t1, $s6		# adds offset for special cases
	sll	$t1, $t1, 2 		# t1 = t1 * 4
	lw 	$t2, Matrix($t1)	# loads what is in Matrix[t1] into t2
	beq	$t2, 0, MLDeadCell  	# if what's in t2 is > 0 increases the number of live cell neighbors
	addi	$s3, $s3, 1
	
MLDeadCell:

	
checkMidRightCurrentCell:
	li	$t1, 0			#resets t1
	li 	$s6, 0  		# Sets offset value
	div 	$s2, $s4		# divdes current cell by rowsize, and puts remainder in HI	
	mfhi 	$t4			# Sets remainder in t4
	add 	$t5, $s4, -1	 	# Sets t5 to rowSize -1
	beq 	$t4, $t5, MRRight	# Checks if on right bound
	j	MRContinue
	
MRRight:
	sub 	$s6, $s6, $s4	
	j	MRContinue	
		
MRContinue:
	addi	$t1, $s2, 1		# t1 = CurrentCell + 1
	add	$t1, $t1, $s6		# adds offset for special cases
	sll	$t1, $t1, 2 		# t1 = t1 * 4
	lw 	$t2, Matrix($t1)	# loads what is in Matrix[t1] into t2
	beq	$t2, 0, MRDeadCell  	# if what's in t2 is > 0 increases the number of live cell neighbors
	addi	$s3, $s3, 1
	
MRDeadCell:

	
checkTopLeft:
	li	$t1, 0			#resets t1
	li 	$s6, 0  		# Sets offset value
	beq 	$t4, 0, TLLeft 		# Checks if on left bound
	j	TLTBContinue
		
TLLeft:
	add 	$s6, $s6, $s4
	j	TLTBContinue
		
TLTBContinue:
	addi	$t1, $s4, -1	
	ble 	$s2, $t1, TLTop		# Checks if on top bound
	j	TLContinue

TLTop:
	add 	$s6, $s6, $s5
	j	TLContinue

TLContinue:
	addi  	$t1, $s2, -1
	sub	$t1, $t1, $s4
	add	$t1, $t1, $s6		# adds offset for special cases	
	sll	$t1, $t1, 2 
	lw 	$t2, Matrix($t1)
	beq	$t2, 0, TLCellDead
	addi 	$s3, ,$s3, 1	
	
TLCellDead:


checkTopMiddle:
	li	$t1, 0			#resets t1
	li 	$s6, 0  		# Sets offset value
	j	TMTBContinue
		
TMTBContinue:
	addi	$t1, $s4, -1	
	ble 	$s2, $t1, TMTop		# Checks if on top bound
	j	TMContinue

TMTop:
	add 	$s6, $s6, $s5
	j	TMContinue

TMContinue:	
	addi	$t1, $s2, 0
	sub	$t1, $t1, $s4
	add	$t1, $t1, $s6		# adds offset for special cases	
	sll	$t1, $t1, 2 
	lw 	$t2, Matrix($t1)
	beq	$t2, 0, TMCellDead
	addi 	$s3, ,$s3, 1	
	
TMCellDead:

	
checkTopRight:
	li	$t1, 0			#resets t1
	li 	$s6, 0  		# Sets offset value
	div  	$s2, $s4		# divdes current cell by rowsize, and puts remainder in HI	
	mfhi 	$t4			# Sets remainder in t4
	add 	$t5, $s4, -1	 	# Sets t5 to rowSize -1
	beq 	$t4, $t5, TRRight	# Checks if on right bound
	j	TRTBContinue
	
TRRight:
	sub 	$s6, $s6, $s4	
	j	TRTBContinue	
		
TRTBContinue:	
	addi	$t1, $s4, -1
	ble 	$s2, $t1, TRTop		# Checks if on top bound
	j	TRContinue

TRTop:
	add 	$s6, $s6, $s5
	j	TRContinue

TRContinue:
	addi  	$t1, $s2, 1
	sub	$t1, $t1, $s4	
	add	$t1, $t1, $s6		# adds offset for special cases
	sll	$t1, $t1, 2 
	lw 	$t2, Matrix($t1)
	beq	$t2, 0, TRCellDead
	addi 	$s3, ,$s3, 1	
	
TRCellDead:

	
checkBottomLeft:
	li	$t1, 0			#resets t1
	li 	$s6, 0  		# Sets offset value
	div  	$s2, $s4		# divdes current cell by rowsize, and puts remainder in HI	
	mfhi 	$t4			# Sets remainder in t4
	beq 	$t4, 0, BLLeft 		# Checks if on left bound
	j	BLTBContinue
	
BLLeft:
	add 	$s6, $s6, $s4
	j	BLTBContinue
		
BLTBContinue:		
	add 	$t5, $s2, $s4		# adds current cell to rowsize
	bge 	$t5, $s5, BLBottom	# checks if on bottom bound
	j	BLContinue	

BLBottom:
	sub 	$s6, $s6, $s5
	j	BLContinue

BLContinue:
	addi  	$t1, $s2, -1
	add	$t1, $t1, $s4	
	add	$t1, $t1, $s6		# adds offset for special cases
	sll	$t1, $t1, 2 
	lw 	$t2, Matrix($t1)
	beq	$t2, 0, BLCellDead
	addi 	$s3, ,$s3, 1	
	
BLCellDead:
	
checkBottomMiddle:
	li	$t1, 0			#resets t1
	li 	$s6, 0  		# Sets offset value
	j	BMTBContinue
		
BMTBContinue:	
	add 	$t5, $s2, $s4		# adds current cell to rowsize
	bge 	$t5, $s5, BMBottom	# checks if on bottom bound
	j	BMContinue

BMBottom:
	sub 	$s6, $s6, $s5
	j	BMContinue

BMContinue:
	add	$t1, $t1, $s2
	add	$t1, $t1, $s4	
	add	$t1, $t1, $s6		# adds offset for special cases
	sll	$t1, $t1, 2 
	lw 	$t2, Matrix($t1)
	beq	$t2, 0, BMCellDead
	addi 	$s3, ,$s3, 1	
	
BMCellDead:


checkBottomRight:
	li	$t1, 0			#resets t1
	li 	$s6, 0  		# Sets offset value
	div  	$s2, $s4		# divdes current cell by rowsize, and puts remainder in HI	
	mfhi 	$t4			# Sets remainder in t4
	add 	$t5, $s4, -1	 	# Sets t5 to rowSize -1
	beq 	$t4, $t5, BRRight	# Checks if on right bound
	j	BRTBContinue

BRRight:
	sub 	$s6, $s6, $s4	
	j	BRTBContinue	

BRTBContinue:		
	add 	$t5, $s2, $s4		# adds current cell to rowsize
	bge 	$t5, $s5, BRBottom	# checks if on bottom bound
	j	BRContinue

BRBottom:
	sub 	$s6, $s6, $s5
	j	BRContinue

BRContinue:
	addi  	$t1, $s2, 1
	add	$t1, $t1, $s4	
	add	$t1, $t1, $s6		# adds offset for special cases
	sll	$t1, $t1, 2 
	lw 	$t2, Matrix($t1)
	beq	$t2, 0, BRCellDead
	addi 	$s3, $s3, 1	
	
BRCellDead:

	#add 	$s2, $s2, 1		# adds 1 to Current Cell
	#bge 	$s2, $s5, CheckCells	# Checks of we are at the maximum value, if not then recurse	
	
	
	jr	$ra			# Return to rules/main

# Alex,Rules    #dispM=display matrix,updM=update matrix,neigh=neighbour
Rules:
    #add check neighbour here....plz,if not that fine we’ll just get a zero for the project,no big deal
    div $s2,$s2,4
    jal CheckCells              #check the neighbours of the current cell
   mul $s2, $s2, 4
     lw $s7,Matrix($s2)         #store current cell in to curTemp
    beq $s3,3,LifeUpdate        #if there 3 neighbour,go to lifeUpdate:keeps it alive or bring it alive
    beq $s3,2,CheckDead         #if there 2 neighnour,go to cheakDead:check if its dead or kill it
    
    li $s7,0                    #current cell will die if you reach here
    j  update                   #go to update the matrix#Alex,update    #update the cell in the Matrix
update:
    sw     $s7, Matrix2($s2)    #put the new current cell value into the update matrix
    addi     $s2,$s2,4          #move to the next cell
    beq    $s2,$s1,swapMatrix   #check if we in the last cell, if yes go to swapMatrix
    j Rules                     #is not the last cell,keep looping#Alex,swapMatrix             #swap both matrix
swapMatrix:        
    li $t0, 0                   # counter initialization
    
swap:    lw $t1,Matrix2($t0)    # current element of update matrix into var
    sw $t1,Matrix($t0)          # update element into display matrix
    addi $t0,$t0, 4             # increment counter
    bne $t0, $s1, swap          # display matrix into the update matrix
    j StartMain                 # jump to Main functionLifeUpdate:                
LifeUpdate:			# keep alive/make alive
    beq $s7,8, update           # if the value at current element is equal to 8
    addi $s7, $s7,1             # add one too current element
    j update     
         
CheckDead:                      # what if dead
       bge $s7, 1, LifeUpdate   # if the element is alive then update life
       li $s7, 0                # element is dead
       j update

exit:
