#!/bin/bash/
#Gustavo Lazarotto Schroeder

TESTCASES_DIR="$1" #o caminho para um diretório onde estão os casos de teste
PROGRAMAC="$2" #o camingo para o programa C
RESPINCORRETAS="Repostas Incorretas ou Não entregues\n"
NUMINCORRETAS="0"

#verifica se a variavel foi inicializada
function verificarSintaxe(){
	if ! [ $TESTCASES_DIR ]; then
    	  echo "Você não definiu um caminho válido para a procura"
    	  exit 1
	fi
}
#Verifica se caminho onde estão os programas existe, senao existe define um
function verificaCaminho(){ 
	if ! [ $PROGRAMAC ]; then
	  PROGRAMAC='.'
	  echo "Diretorio '$PROGRAMAC' não existe. O caminho foi direcionado para a pasta padrão"
	fi
}

function compilaTestaArquivo(){
#Variáveis utilizadas
  var_string=" "
  inicio="problema_"
  entrada="_INPUT"
  saida="_OUTPUT"
  contNumFin=00
  contNumSoluc=00
  contMais=1
  contPastas=$(ls $PROGRAMAC | wc -l);
  extensaoc=".c"
  extensaoo=".o"
  solucao=" "

	while test $contPasta -gt "0"; do
	   #Todos os caminhos feitos usando variáveis
	   caminho=$inicio$contNumFin$extensaoc
	   caminho01=$inicio$contNumFin
	  if [ ! -e "$PROGRAMAC/*" "$caminho" ]; then #testa se arquivo existe
	     var_string="Problema numero $contNumFin não existe \n"
	     RESPINCORRETAS=$RESPINCORRETAS$var_string
	     NUMINCORRETAS=$((NUMINCORRETAS+contMais))
	   else
	   #caso existir compila o programa
	   	conta_arquivos=$((ls $TESTCASES_DIR/*.$caminho01 | wc -l)/2)
	   		while test $conta_arquivos -gt "0"; do
	   		  caminho_saida=$TESTCASES_DIR/*$contNumSoluc$saida
	   		  caminho_entrada=$TESTCASES_DIR/*$contNumSoluc$entrada

		         if [ gcc "$caminho" -o "$caminho1" -ne 0 ]; then 
	   			##testa se o gcc falhou, caso tenha falhado o programa C já está errado.
	   			var_string="Problema numero $contNumFin erro de compilação\n"
	   			RESPINCORRETAS=$RESPINCORRETAS$var_string
	   			NUMINCORRETAS=$((NUMINCORRETAS+contMais))
		 		break
		         else
		         	#executa o arquivo mudando a entrada padrão
	                	solucao=$caminho_saida < $($caminho_entrada$conta_arquivos) 
	                	# Se resultado for diferente da solução está errado
 				 if [ "$caminho_saida" -ne "$solucao" ]; then  
				   NUMINCORRETAS=$((NUMINCORRETAS+contMais))
		                   var_string="Problema numero $contNumFin erro na resposta \n"
		                   RESPINCORRETAS=$RESPINCORRETAS$var_string
				   else
				   #caso esteja correta a contador para os teste é incrementado 
                                     contNumSoluc=$((contNumSoluc+contMais))
			         fi
			   fi
		    done
		    solucao=" " #zera a variável
		    var_string=" " #zera variável
                    contNumFin=$((contNumFin-contMais)) #caso nao exista já passa esse
		fi
	caminho=" "
   	caminho01=" "
	caminho_saida=" "
	caminho_entrada=" "
	done
	
	exit $NUMINCORRETAS
}
