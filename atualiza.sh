#! /bin/bash

echo "Executando atualização do mapa de teclado do modo gráfico"
echo
echo "cp nativo /usr/share/X11/xkb/symbols"
echo "cp nativo.xml /usr/share/X11/xkb/rules"
echo "cp nativo.lst /usr/share/X11/xkb/rules"

sudo cp abnt /usr/share/X11/xkb/geometry
sudo cp nativo /usr/share/X11/xkb/symbols
sudo cp nativo /usr/share/X11/xkb/symbols/br
sudo cp nativo.xml /usr/share/X11/xkb/rules
sudo cp nativo.lst /usr/share/X11/xkb/rules
sudo cp nativo.lst /usr/share/X11/xkb/rules/nativo

cp XCompose ~/.XCompose

sudo python ./ajusta_xml_xkeyboard.py

echo
echo "Mapa de teclado do modo gráfico atualizado com sucesso!"
echo

sudo ./cria_mapa_console.sh
