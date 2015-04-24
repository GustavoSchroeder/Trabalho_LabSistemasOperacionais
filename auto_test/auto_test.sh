#!/bin/bash/
#Gustavo Lazarotto Schroeder

TESTCASES_DIR="$*" #o caminho para um diretório onde estão os casos de teste
PROGRAMAC="$*" #o camingo para o programa C
RESPINCORRETAS=0;

#verifica se a variavel foi inicializada
function verificarSintaxe(){ 
	if ! [ $TESTCASES_DIR ] then
    	  TESTCASES_DIR='.'
    	  echo "Você não definiu um caminho válido para a procura"
	fi
}

#Verifica se caminho onde estão os programas existe, senao existe define um
function verificaCaminho(){ 
	if ! [ $PROGRAMAC ] then
	  PROGRAMAC='.'
	  echo "Diretorio '$PROGRAMAC' não existe. O caminho foi direcionado para a pasta padrão"
	fi
}

function compilaTestaArquivo(){
  inicio="problema_"
  entrada="_INPUT"
  saida="_OUTPUT"
  contNumFin=00
  contMais=1
  contPastas=$(ls ./ | wc -l);
  registroDeErros=" - Erros -  \n"
  extensaoc=".c"
  extensaoo=".o"

	while test $contPasta -gt "0"; do
		#Todos os caminhos feitos usando variáveis
	   caminho=$inicio$contNumFin$extensaoc
	   caminho01=$inicio$contNumFin
	   caminho_saida=$TESTCASES_DIR$contNumFim$saida
	   caminho_entrada=$TESTCASES_DIR$contpasta$entrada
	   
           if [ ! -e "$PROGRAMAC" "$inicio" "$contNumFin" ".c" ] then #testa se arquivo existe
	     echo "Arquivo não existe"
	     $contNumFin=$((contNumFin-contMais)) #caso nao exista já passa esse
	   else
	   #caso existir compila o programa
		 if [ gcc "$caminho" -o "$caminho1" ] then 
	   		##testa se o gcc falhou, caso tenha falhado o programa C já está errado.
	   		$registroDeErros="Código contém erro: Programa número $contNumFin (Erro de compilação) \n"
		 	$contNumFin=$((contNumFin-contMais))
		   else
			$contNumFin=$((contNumFin-contMais)) #incrementa contador
	           	solucao=$caminho_saida < $caminho_entrada #executa o arquivo mudando a entrada padrão
	 
		 	if [ "$caminho_saida" -ne "$solucao" ] then  # Se resultado for diferente da solução está errado
				$registroDeErros="Código contém erro: Programa número $contNumFin (Erro na saída) \n"
				$contNumFin=$((contNumFin-contMais))
			fi
		fi
	fi
	caminho=" "
   	caminho01=" "
	caminho_saida=" "
	caminho_entrada=" "
	done
}
