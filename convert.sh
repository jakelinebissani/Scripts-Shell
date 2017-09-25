#!/bin/bash

#convert /home/jakeline/Documentos/imagens-livros/amazon_aws.jpg /home/jakeline/Documentos/imagens-livros/amazon_aws.png


#CAMINHO_IMAGENS=/home/jakeline/Documentos/imagens-livros

#for imagem in $@
#do
	#convert $CAMINHO_IMAGENS/$imagem.jpg $CAMINHO_IMAGENS/$imagem.png
#done
converte_imagem(){
cd /home/jakeline/Documentos/imagens-livros

if [ ! -d png ]
then
    mkdir png
fi

for imagem in *.jpg
do
	# armazando o conteudo da função na variavel imagem_sem_extensao
	local imagem_sem_extensao=$(ls $imagem | awk -F. '{ print $1 }')
    convert $imagem_sem_extensao.jpg png/$imagem_sem_extensao.png
done
}

converte_imagem 2>erros_conversao.txt
if [ $? -eq 0 ]
then
    echo "Conversão realizada com sucesso"
else
    echo "Houve uma falha no processo"
fi