var i, idade, peso, sexo, quanthom = 0, quantmulh = 0, mediaidhom, idadehom = 0, pesomulh = 0, mediapesomulh;

            for(i = 1; i <= 10; i++) {
                idade = parseInt(prompt("Sua idade["+i+"]:"));
                peso = parseInt(prompt("Seu peso["+i+"]:"));
                sexo = prompt("Sexo: M ou F:");

                if(sexo == 'm') {                    
                    quanthom++;
                    idadehom += idade;
                } if (sexo == 'f') {
                    quantmulh++;
                    pesomulh += peso;
                }
            }
            mediaidhom = idadehom/quanthom;
            mediapesomulh = pesomulh/quantmulh;
            alert("Total de homens: "+quanthom);
            alert("Total de mulheres: "+quantmulh);
            alert("Média das idades dos homens: "+mediaidhom);
            alert("Média dos pesos das mulheres: "+mediapesomulh);