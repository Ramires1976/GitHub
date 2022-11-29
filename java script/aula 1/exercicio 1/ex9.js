var i, num, par = 0, impar = 0;            

            for(i = 1 ;i <= 10; i++) {        
                num = parseInt(prompt("Informe um numero["+i+"]:")); 

                if(num %2 == 0) { 
                    par += num; 
                } else { 
                    impar += num;
                }
            }
            alert("A soma dos números pares é: "+par); 
            alert("A soma dos números ímpares é: "+impar);