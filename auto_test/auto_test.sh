
#!/bin/bash/
#Gustavo Lazarotto Schroeder

TESTCASES_DIR="$*" #o caminho para um diretório onde estão os casos de teste
PROGRAMAC="$*" #o camingo para o programa C

function verificarSintaxe(){ #verifica se a variavel foi inicializada
	if test -z "$TESTCASES_DIR"; then
		echo "Você não definiu um caminho válido para a procura"	
		exit 1
}

function verificaCaminho(){ #Verifica se caminho onde estão os programas existe, senao existe define um
	if [ ! -d "PROGRAMAC" ]; then
	   echo "Diretorio '$MON_DIR' não existe" > ./$PROGRAMAC
   	exit 2
	fi
	
##if "$TESTCASES_DIR_DIR" | egrep '\' > /dev/null
##	then
##		echo "Path correto"
##	else
##		$var=$TESTCASES_DIR
##		$TESTCASES_DIR = ".\$var"
}

function trataArquivo(){
contador=00; 
contPasta=ls ./ | wc -l;

while($($contPasta /2) -lt "0")
	do
	#codigo	
	#codigo




contador=$($contador+1)
}

