#!/bin/bash
#
#script script.sh
# Version : 1.0
#Utiliza certificado de la PKI para validar los certificados emitidos según el números de serie guardado  en archivototal.txt , esto para validar el servico oscp de la entidad de certificación
#Autor : Ing. Jorge Navarrete
#mail : jorge_n@web.de
#Fecha : 2019-12-13

#script script.sh
#Utiliza certificado de la PKI para validar los certificados emitidos según el números de serie guardado  en archivototal.txt , esto para validar el servico oscp de la entidad de certificación


c=1
d=0
# campo separador de nueva línea
IFS="
"

#while [ $c -le 999999999999999999 ]
while [ $c -le 1 ]
do
	for line in `cat filetotal.txt`;do
#      nice -n 15 nohup links -source http://www.icert.fje.gob.ec/ > /dev/null &
#      nice -n 15 nohup openssl ocsp -issuer cj-subca-prod.pem -serial 0X22c7a2b93f4e8522 -url http://ocsp.icert.fje.gob.ec -text #> /dev/null &
      #nice -n 15 nohup openssl ocsp -issuer cj-subca-prod.cer -serial 0X4E4042832295322C -url http://ocsp.icert.fje.gob.ec -text > ./log/hola$d.txt &

        	nuevaline="0X"`echo $line`
      		nice -n 15 nohup openssl ocsp -issuer cj-subca-prod.cer -serial $nuevaline -url http://ocsp.icert.fje.gob.ec -text > ./log/hola$d.txt &
        #echo " $c juas!"
       	#	 echo $nuevaline
      # sleep 1
        (( d++ ))
	done
(( c++ ))
done

