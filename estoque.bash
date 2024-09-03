#!/bin/bash
echo "Bem vindo ao Gerenciador de Estoque!"
echo "1 - Listar estoque"
echo "2 - Mesclar Estoque"
echo "3 - Imprimir paginadamente a pasta"
#read -p "Escolha uma opção: " OPCAO
read OPCAO
if [ "$OPCAO" -eq 1 ]; then
    echo "Qual arquivo?"
    read ARQUIVO
    if [ -f "$ARQUIVO" ]; then
        cat "$ARQUIVO"
    else
        echo "ESSE ARQUIVO NÃO EXISTE!!"
    fi
elif [ "$OPCAO" -eq 2 ]; then
    echo "Qual o 1º arquivo?"
    read ARQUIVO1
    echo "Qual o 2º arquivo?"
    read ARQUIVO2
    echo "Qual o nome do 3º arquivo?"
    read ARQUIVO3
	#testando...
    if [ -f "$ARQUIVO1" ] && [ -f "$ARQUIVO2" ]; then
        cp "$ARQUIVO1" "$ARQUIVO3"
        #quantas linhas?
		LINHAS=$(cat $ARQUIVO2 | wc -l)
		#coloca o arquivo2 no 3 tmb
		$(tail -"$(($LINHAS-1))" $ARQUIVO2 >> $ARQUIVO3)   
    else
        echo "Um dos arquivos não existe!"
    fi
elif [ "$OPCAO" -eq 3 ]; then
    ITEM=$(ls)
    for file in $ITEM; do
        if [ "$file" != "$0" ]; then
            less "$file"
        fi
    done
else
    echo "Opção inválida!"
fi
