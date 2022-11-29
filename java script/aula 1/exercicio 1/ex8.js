var i, idade, opniao, idadeotimo = 0, contaidadeotimo = 0, mediaidot, quantregular = 0, contquantregular = 0, quantbom = 0, contquantbom = 0, prctbom;

            for(i = 1; i <= 15; i++) {
                idade = parseInt(prompt("Sua idade["+i+"]:"));
                opniao = prompt("Sua opnião em relação ao filme: ótimo - 3, bom - 2, regular - 1:");

                if(opniao == 3) {
                    idadeotimo += idade;
                    contaidadeotimo++;
                } if(opniao == 1) {
                    quantregular += opniao;
                    contquantregular++;
                } if(opniao == 2) {
                    quantbom += opniao;
                    contquantbom++;
                }
            } mediaidot = idadeotimo/contaidadeotimo;
            prctbom = (contquantbom*100)/15;
            alert("Média das idades das pessoas que responderam ótimo: "+mediaidot);
            alert("Quantidade de pessoas que responderam regular é: "+contquantregular);
            alert("Porcentagem de pessoas que responderam bom: "+prctbom);