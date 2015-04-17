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
  solucao="_INPUT"
  contNumFin=00
  contMais=1
  contPastas=$(ls ./ | wc -l);

	while test $contPasta -lt "0"; do
           if(! -e "$PROGRAMAC" "$inicio" "$contNumFin" ".c") #testa se arquivo existe
	     echo "Arquivo não existe"
	     $contNumFin=$((contNumFin-contMais)) #caso nao exista já passa esse
	   else

	   gcc problema_"$contNumFin".c -o "$inicio" "$contNumFin" #caso existir compila o programa
	   ##testar se o gcc falhou, caso tenha falhado o programa C já está errado.

	   $contNumFin=$((contNumFin+contMais)) #incrementa contador
	  ./$inicio$contNumFin.o < ./$contpasta$solucao #executa o arquivo mudando a entrada padrão
	
	## utiliza uma variável para pegara saída 
	##falta captar a saida do programa c e testala com a solução.
	
	fi
}
