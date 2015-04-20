#!/bin/bash/
#Gustavo Lazarotto Schroeder

TESTCASES_DIR="$*" #o caminho para um diretório onde estão os casos de teste
PROGRAMAC="$*" #o camingo para o programa C
RESPINCORRETAS=0;

#verifica se a variavel foi inicializada
function verificarSintaxe(){ 
	if test -z "$TESTCASES_DIR"; then
		echo "Você não definiu um caminho válido para a procura"	
		exit 1
}

#Verifica se caminho onde estão os programas existe, senao existe define um
function verificaCaminho(){ 
	if [ ! -d "PROGRAMAC" ]; then
	   echo "Diretorio '$PROGRAMAC' não existe. O caminho foi direcionado para a pasta padrão" > ./$PROGRAMAC
   	exit 2
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

	while test $contPasta -gt "0"; do
           if(! -e "$PROGRAMAC" "$inicio" "$contNumFin" ".c") #testa se arquivo existe
	     echo "Arquivo não existe"
	     $contNumFin=$((contNumFin-contMais)) #caso nao exista já passa esse
	   else
	   #caso existir compila o programa
		 caminho="$inicio" "$contNumFin" ".c" 
		 caminho01="$inicio" "$contNumFin"
		 if gcc "$caminho" -o "$caminho1"  then 
	   		##testa se o gcc falhou, caso tenha falhado o programa C já está errado.
	   		$registroDeErros="Código contém erro: Programa número $contNumFin (Erro de compilação) \n"
		 	$contNumFin=$((contNumFin-contMais))
		   else
			 $contNumFin=$((contNumFin-contMais)) #incrementa contador
	           	solucao=./$caminho01.o < ./$contpasta$entrada #executa o arquivo mudando a entrada padrão
	 
		 	if "$TESTCASES_DIR$contNumFim$saida" -ne "$solucao" then
				$registroDeErros="Código contém erro: Programa número $contNumFin (Erro na saída) \n"
				$contNumFin=$((contNumFin-contMais))
			fi
		fi
	fi
}
