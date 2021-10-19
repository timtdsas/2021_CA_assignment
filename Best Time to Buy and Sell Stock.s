.data
arr: .word 7,1,5,3,6,4,11,3,5,7,1,20 # array
len: .word 12 # number of elemnet in array
str: .string "Max Profit in these days is "

.text
# s1 = base address of array
# t0 = i
# t1 = nums[i]
# s2 = p_gap (gap of prize)
# s3 = numsSize (number of elemnet in array)
# s4 = min_price (intmax)


main:
    la s1, arr        # s1 = pointer to nums[0]
    li s4, -1         # s4 = -1
    srli s4, s4, 1    # let -1 shift right logic imm by 1, to get the largest num
    lw s3, len        # s3 = numsSize
    add t0, x0, x0    # i = 0
    add s2, x0, x0    # s5 =0
    jal ra, loop      # jump to loop and save the addr. of instr "jal ra, print" to reg "ra"
    jal ra, print     # jump to print and save the addr. of instr "li a7, 10" to reg "ra"
    li a7, 10         # end the program
    ecall
        
loop:
    lw t1, 0(s1)      # t1 = prices[i]
    bgt t1, s4, if2   # if (prices[i]>min_price) than branch
    add s4, x0, t1    # min_price=prices[i]
if2: 
    sub t2, t1, s4    # price[i]-min_price
    blt t2, s2, if3   # if(prices[i]-min_price<p_gap) than branch 
    sub s2, t1, s4    # p_gap=prices[i]-min_price
if3:
    addi s1, s1, 4    # nums++ (address move forward)
    addi t0, t0, 1    # i++
    blt t0, s3, loop  # if i < array length
    jr ra             # else, return to main

print:
    la a0, str        # load string
    li a7, 4          # print string
    ecall
    add a0, s2, x0    # load result
    li a7, 1          # print integer
    ecall
    jr ra             # go back to main