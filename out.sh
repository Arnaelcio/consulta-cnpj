#!/usr/bin/bash

# author: Arnaelcio Gomes Pereira <arnaelcio.gomes@gmail.com>
# description: Script to consult the registration status of companies.
# version: 0.3
# License: MIT License 


#########################################################################################################################################
##                                                                                                                                     ##
##         ScriptShell criado para consultar situação cadastral de empresas brasileiras utilizando número do CNPJ.                     ##
##                                                                                                                                     ##
##         Para consultar basta digitar os 15 números que compõem o cnpj e pressionar enter.                                           ##
##         Caso o número seja válido, em alguns segundos o Script retornará com informações como:                                      ##
##         SITUACÃO, NOME FANTASIA,TITULAR,LOGRADOURO, NÚMERO,COMPLEMENTO, BAIRRO, CEP, MUNICÍPIO, ESTADO, TELEFONE.                   ##
##                                                                                                                                     ##
##         Caso o número digitado seja inválido o Script retornrá a mensagem: CNPJ INEXISTENTE !!                                      ##
##                                                                                                                                     ##
##         O criação desse Script tem caráter meramente didático, com o intuito de por em prática os                                   ##
##         conhecimentos adaquiridos na discpilna de Shell script básico.                                                              ##
##                                                                                                                                     ##
##         !!Para funcionar o script compõe-se de 3 arquivos, por isso não os remova/apague para evitar erros.                         ##
#########################################################################################################################################
##                                                                                                                                     ##
##                                                 COMO USAR:                                                                          ##
##                                     1 - abra o diretório consulta-cnpj                                                              ##
##                                     2 - digite o comando : ./out.sh                                                                 ##
##                                     3 - digite o número do CNPJ desejado                                                            ##
##                                     4-  aguarde o resultado da consulta                                                             ##
##                                                                                                                                     ##
##                                                                                                                                     ##
##         COMANDOS USADOS PARA CRIAR O SCRIPT e DEFINIÇÕES:                                                                           ##
##                                                                                                                                     ##
##      curl -X GET https://www.receitaws.com.br/v1/cnpj/(numero desejado) - faz a consulta na API para obter a situação cadastral.    ##
##      cat  db.txt | sed 's/.*"situacao"://g'| sed 's/,.*//g' - Usado para mostrar somente a situação cadastral;                      ##
##      cat  db.txt | sed 's/.*"fantasia"://g'| sed 's/,.*//g' - Usado para mostrar somente o nome fantasia da empresa;                ##
##      cat  db.txt | sed 's/.*"telefone"://g'| sed 's/,.*//g' -TELEFONE - Usado para mostrar somente o telefone;                      ##
##      cat  db.txt | sed 's/.*"nome"://g'| sed 's/}].*//g'  - Usado para mostrar somente o nome do titular da empresa;                ##
##      cat  db.txt | sed 's/.*"logradouro"://g'| sed 's/,"numero":.*//g' - Usado para mostrar somente o logradouro;                   ##
##      cat  db.txt | sed 's/.*"numero"://g'| sed 's/,.*//g' - Usado para mostrar somente o número;                                    ##
##      cat  db.txt | sed 's/.*"complemento"://g'| sed 's/,.*//g' - Usado para mostrar somente o complemento;                          ##
##      cat  db.txt | sed 's/.*"bairro"://g'| sed 's/,.*//g'-  Usado para mostrar somente o bairro;                                    ##
##      cat  db.txt | sed 's/.*"cep"://g'| sed 's/,.*//g' - Usado para mostrar somente o cep;                                          ##
##      cat  db.txt | sed 's/.*"municipio"://g'| sed 's/,.*//g' - Usado para mostrar somente o município                               ##
##      cat  db.txt | sed 's/.*"uf"://g'| sed 's/,.*//g' - Usado para mostrar somente o estado;                                        ##
##      cat status.txt | sed 's/"//g' - testa o Status - Usado para mostrar se o número digitado é válido;                             ##
##																                                                                       ##
#########################################################################################################################################




read -p "Digite um CNPJ (somente os números) " CNPJ


RUN=`curl -s -X GET https://www.receitaws.com.br/v1/cnpj/$CNPJ > db.txt`
STATUSCNPJ=`cat  db.txt | sed 's/.*"status"://g'| sed 's/,.*//g' > status.txt`
EXISTECNPJ=`cat  status.txt |sed 's/"//g'`
SITUACAO=`cat  db.txt | sed 's/.*"situacao"://g'| sed 's/,.*//g'`
FANTASIA=`cat  db.txt | sed 's/.*"fantasia"://g'| sed 's/,.*//g'`
TELEFONE=`cat  db.txt | sed 's/.*"telefone"://g'| sed 's/,.*//g'`
TITULAR=`cat  db.txt | sed 's/.*"nome"://g'| sed 's/}].*//g'` 
LOGRADOURO=`cat  db.txt | sed 's/.*"logradouro"://g'| sed 's/,"numero":.*//g'`
NUMERO=`cat  db.txt | sed 's/.*"numero"://g'| sed 's/,.*//g'`
COMPLEMENTO=`cat  db.txt | sed 's/.*"complemento"://g'| sed 's/,.*//g'`
BAIRRO=`cat  db.txt | sed 's/.*"bairro"://g'| sed 's/,.*//g'`
CEP=`cat  db.txt | sed 's/.*"cep"://g'| sed 's/,.*//g'`
MUNICIPIO=`cat  db.txt | sed 's/.*"municipio"://g'| sed 's/,.*//g'`
ESTADO=`cat  db.txt | sed 's/.*"uf"://g'| sed 's/,.*//g'`


if [[ "$EXISTECNPJ" == "ERROR" ]]
        then
            echo 'CNPJ INEXISTENTE !!'
        else
            echo -ne "PROCESSANDO---PROCESSANDO\r";
            echo -ne ">\r";
            sleep 0.3;
            echo -ne "PROCESSANDO---PROCESSANDO\r";
            echo -ne "=-\r";
            sleep 0.3;
            echo -ne "PROCESSANDO---PROCESSANDO\r";
            echo -ne "-=>\r";
            sleep 0.3;
            echo -ne "PROCESSANDO---PROCESSANDO\r";
            echo -ne ".-=-\r";
            sleep 0.3;
            echo -ne "PROCESSANDO---PROCESSANDO\r";
            echo -ne "..-=>\r";
            sleep 0.3;
            echo -ne "PROCESSANDO---PROCESSANDO\r";
            echo -ne "...-=-\r";
            sleep 0.3;
            echo -ne "....-=>\r";
            sleep 0.3;
            echo -ne ".....-=-\r";
            sleep 0.3;
            echo -ne "......-=>\r";
            sleep 0.3;
            echo -ne ".......-=-\r";
            sleep 0.3;
            echo -ne "........-=>\r";
            sleep 0.3;
            echo -ne ".........-=-\r";
            sleep 0.3;
            echo -ne "..........-=>\r";
            sleep 0.3;
            echo -ne "...........-=-\r";
            sleep 0.3;
            echo -ne "............-=>\r";
            sleep 0.3;
            echo -ne ".............-=-\r";
            sleep 0.3;
            echo -ne "..............-=>\r";
            sleep 0.3;
            echo -ne "...............-=-\r";
            sleep 0.3;
            echo -ne "................-=>\r";
            sleep 0.3;
            echo -ne ".................-=-\r";
            sleep 0.3;
            echo -ne "..................-=>\r";
            sleep 0.3;
            echo -ne "...................-=-\r";
            sleep 0.3;
            echo -ne "....................-=>\r";
            sleep 0.3;
            echo -ne ".....................-=-\r";
            sleep 0.3;
            echo -ne "......................-=>\r";
            sleep 0.3;
            echo -ne ".......................-=-\r";
            sleep 0.3;
            echo -ne "........................-=>\r";
            sleep 0.3;
            echo -ne ".........................-=-\r";
            sleep 0.3;
            echo -ne "..........................-=>\r";
            sleep 0.3;
            echo -ne "...........................-=-\r";
            sleep 0.3;
                # echo -ne "..........................-=>\r";
            clear;    
            sleep 0.3;        

            echo " SITUACÃO: $SITUACAO
 NOME FANTASIA: $FANTASIA 
 TITULAR: $TITULAR
 LOGRADOURO: $LOGRADOURO
 NÚMERO: $NUMERO
 COMPLEMENTO: $COMPLEMENTO
 BAIRRO: $BAIRRO
 CEP: $CEP
 MUNICÍPIO: $MUNICIPIO
 ESTADO: $ESTADO
 TELEFONE: $TELEFONE"

fi
