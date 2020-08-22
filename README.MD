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




