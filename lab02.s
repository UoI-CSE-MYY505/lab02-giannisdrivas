
.data

array: .word 1, 0, 1, 12, 0, 1, 4

.text

    la a0, array
    li a1, 7    # unsigned
    li a2, 1
prog:
    bne a1,zero,else 
    li s0,0            #array is empty
    j done                
        
else:                #find the last address and store it to t0
    addi a1,a1,-1    #this way you dont itterate through whole array,
    slli a1,a1,2     #you find the last one right away
    add t0,a0,a1
    
loop:                        #itterate the array
    blt t0,a0,not_found    
    lw t1,0(t0)
    beq a2,t1,found
    addi t0,t0,-4  
    j loop

not_found:                #value not found in the array
    add s0,zero,zero
    j done

found:                    #value found in array
    add s0,zero,zero
    add s0,s0,t0

done:
    addi a7, zero, 10 
    ecall
