#--------------Calculator Code------

[int]$num1=Read-Host -Prompt "Enter The 1st Number" #used to read input from console
[char]$op=Read-Host -Prompt "Enter The Operation[+,-,/,%,*]"
[int]$num2=Read-Host -Prompt "Enter The 2nd Number"

switch($op)
{
    '+'{
        $feed="You choose Addition"
        [int]$ans=$num1 + $num2
        break;
    }
    '-'{
        $feed="You choose Substraction"
        [int]$ans=$num1 - $num2
        break;
    }
    '*'{
        $feed="You choose Multiplication"
        [int]$ans=$num1 * $num2
        break;
    }
   '/'{
        $feed="You choose Division"
        [double]$ans=$num1 / $num2
        break;
    }
    '%'{
        $feed="You choose Modulus"
        [int]$ans=$num1 % $num2
        break;
    }

}

Write-Host("Option : $feed ") #this is used to print on the console
Write-Host("your ans is : $ans")
pause #this will stop the console