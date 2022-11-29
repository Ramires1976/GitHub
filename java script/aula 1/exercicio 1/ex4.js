var init = function() {
	let valorProduto = getValorProduto();
	showResultado(valorProduto);
};

var getValorProduto = function() {
	return Number(prompt('digite o valor do Produto: '))
};

var showResultado = function(valorProduto) {
	var resultado = getTemplateLinhaValor(valorProduto, 10);
	//var resultado = getTabelaLinhaValor(valorProduto, 10);
	var elemento = getElementResultado();
	elemento.innerHTML = resultado;
};

var getTemplateLinhaValor = function(valorProduto, numeroParcela) {
	var template = '';
	for(var i=0; i<=numeroParcela; i++) {
		var textoPrestacao = '';
		if(i === 0) { textoPrestacao = 'à vista'; }
		else { textoPrestacao = i + 'X'; }

		template += '<h3> Valor ' + textoPrestacao + ': R$ ' + calcularValorPrestacao(valorProduto, i) + ' reais';
		if(i > 0) { template += ', total a prazo: R$ ' + calcularValorTotal(valorProduto, i) + ' reais </h3>'; }
	}
	return template;
};

var getTabelaLinhaValor = function(valorProduto, numeroParcela) {
	var template  = '<table border="1">';
		template += '<thead><tr><th> Parcelas </th><th> Valor Parcela (R$) </th><th> Valor Total (R$) </th></tr></thead>';
	for(var i=0; i<=numeroParcela; i++) {
		var parcelas = i + 'x';
		if(i===0) { parcelas = 'à vista'; }
		template += '<tbody><tr><td align="center">' + parcelas + '</td>';
		template += '<td align="right">' + calcularValorPrestacao(valorProduto, i) + '</td>';
		template += '<td align="right">' + calcularValorTotal(valorProduto, i) + '</td></tr></tbody>';
	}
	    template += '</table>';
	return template;
};

var calcularValorPrestacao = function(valorProduto, numeroParcela) {
	if(numeroParcela === 0) return valorProduto.toFixed(2);
	var valorPrestacao = 0.0;
	if(numeroParcela <= 3) {
		valorPrestacao = (valorProduto * 1.1) / numeroParcela;
	} else {
		valorPrestacao = (valorProduto * 1.2) / numeroParcela;		
	}
	return valorPrestacao.toFixed(2);
};

var calcularValorTotal = function(valorProduto, numeroParcela) {
	if(numeroParcela === 0) return valorProduto.toFixed(2);
	var valorTotal = 0.0;
	if(numeroParcela <= 3) {
		numeroParcela = (valorProduto * 1.1);
	} else {
		numeroParcela = (valorProduto * 1.2);		
	}
	return numeroParcela.toFixed(2);
};

var getElementResultado = function() {
	return document.getElementById("resultado");
};

init();