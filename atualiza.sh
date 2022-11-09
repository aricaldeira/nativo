#! /bin/bash

echo "Executando atualização do mapa de teclado do modo gráfico"
echo
echo "cp nativo /usr/share/X11/xkb/symbols"
echo "cp nativo.xml /usr/share/X11/xkb/rules"
echo "cp nativo.lst /usr/share/X11/xkb/rules"

#
# Geometria do teclado, e arquivos de configuração em modo gráfico
#
sudo cp abnt /usr/share/X11/xkb/geometry
sudo cp nativo.xml /usr/share/X11/xkb/rules
sudo cp nativo.lst /usr/share/X11/xkb/rules
sudo cp nativo.lst /usr/share/X11/xkb/rules/nativo

sudo python3 ./ajusta_xml_xkeyboard.py

#
# Regras de composição
#
cp XCompose ~/.XCompose

#
# Mapas de teclas
#
sudo cp nativo /usr/share/X11/xkb/symbols
sudo cp nativo /usr/share/X11/xkb/symbols/br
sudo cp nativo_base /usr/share/X11/xkb/symbols
sudo cp nativo_numerico /usr/share/X11/xkb/symbols

#
# Línguas com o alfabeto latino
#
sudo cp nativo_abnt2 /usr/share/X11/xkb/symbols
sudo cp nativo_afi /usr/share/X11/xkb/symbols
sudo cp nativo_africa /usr/share/X11/xkb/symbols
sudo cp nativo_catalao /usr/share/X11/xkb/symbols
sudo cp nativo_espanhol /usr/share/X11/xkb/symbols
sudo cp nativo_esperanto /usr/share/X11/xkb/symbols
sudo cp nativo_frances /usr/share/X11/xkb/symbols
sudo cp nativo_italiano /usr/share/X11/xkb/symbols
sudo cp nativo_latim /usr/share/X11/xkb/symbols
sudo cp nativo_obv /usr/share/X11/xkb/symbols
sudo cp nativo_original /usr/share/X11/xkb/symbols
sudo cp nativo_polones /usr/share/X11/xkb/symbols
sudo cp nativo_romeno /usr/share/X11/xkb/symbols
sudo cp nativo_turco /usr/share/X11/xkb/symbols

#
# Outros alfabetos e sistemas de escrita
#
sudo cp nativo_arabe /usr/share/X11/xkb/symbols
sudo cp nativo_armenio /usr/share/X11/xkb/symbols
sudo cp nativo_coreano /usr/share/X11/xkb/symbols
sudo cp nativo_devanagari /usr/share/X11/xkb/symbols
sudo cp nativo_georgiano /usr/share/X11/xkb/symbols
sudo cp nativo_grego /usr/share/X11/xkb/symbols
sudo cp nativo_hebraico /usr/share/X11/xkb/symbols
sudo cp nativo_persa /usr/share/X11/xkb/symbols
sudo cp nativo_russo /usr/share/X11/xkb/symbols
sudo cp nativo_shavian /usr/share/X11/xkb/symbols
sudo cp nativo_ucraniano /usr/share/X11/xkb/symbols

echo
echo "Mapa de teclado do modo gráfico atualizado com sucesso!"
echo

sudo ./cria_mapa_console.sh
