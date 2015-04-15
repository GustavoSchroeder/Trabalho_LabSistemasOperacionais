
#!/bin/bash/
#Gustavo Lazarotto Schroeder

TESTCASES_DIR="$*" #o caminho para um diretório onde estão os casos de teste
PROGRAMAC="$*" #o camingo para o programa C
RESPINCORRETAS=0;

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
}

function compilaTestaArquivo(){
inicio="problema_"
solucao="_INPUT"
contNumFin=00
contMais=1
contPastas=ls ./ | wc -l;
	while($contPasta -lt "0"); do
	if(! -e "$PROGRAMAC" "$inicio" "$contNumFin" ".c")
	echo "Arquivo não existe"
	$contNumFin=$contNumFin+$contMais
	else
	gcc problema_"$contNumFin".c -o "$inicio" "$contNumFin"
	chmod x+u "$inicio" "$contNumFin" ".o"
	$contNumFin=$contNumFin+$contMais
	./$inicio$contNumFin.o < ./$contpasta$solucao
	##falta captar a saida do programa c e testala com a solução.
	fi
}

##function testaarquivo(){ //Função descontinuada, irá ser feito em CompilaeTestaArquivo.
##contador=00
##contPasta=ls ./ | wc -l;

##while($($contPasta /2) -lt "0");
##	do
##contador=$($contador+1)
}

