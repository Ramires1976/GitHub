//Crie um programa de cadastro de livros de uma loja (utilizando React). 
// O programa deve implementar as funcionalidades descritas no texto abaixo:
 
//(0) - Crie o protótipo e anexe na atividade;
//(1) - Cadastrar livro;
//(2) - Pesquisar livro;

//O cadastro do  deve solicitar código do livro, titulo, autor, data. 
//O programa deve respeitar as seguintes restrições:
//⦁ A pesquisa deve ser feita pelo código ou autor; 
//⦁ A exclusão deve ser feita pela tabela de livros;

//(desafio) A tabela de livros deve apresentar quantos livros com 
// o mesmo titulo existem na loja

import { useState } from "react";
import "./App.css";

function App() {
  const [codigoPesquisa, setCodigoPesquisa] = useState("");
  const [tituloPesquisa, setTituloPesquisa] = useState("");
  const [autorPesquisa, setAutorPesquisa] = useState("");
  const [dataPesquisa, setDataPesquisa] = useState("");

  const [codigo, setCodigo] = useState("");
  const [titulo, setTitulo] = useState("");
  const [autor, setAutor] = useState("");
  const [data, setData] = useState("");

  const [livros, setLivros] = useState([]);
}
