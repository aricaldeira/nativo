#! /bin/bash

echo "Executanto atualização do mapa de teclado do console"
echo
echo "ckbcomp -model abnt -layout nativo -variant nativo > /usr/share/kbd/keymaps/i386/qwerty/nativo.map"
echo "ckbcomp -model abnt -layout nativo -variant original > /usr/share/kbd/keymaps/i386/qwerty/original.map"
echo "ckbcomp -model abnt -layout nativo -variant abnt2 > /usr/share/kbd/keymaps/i386/qwerty/abnt2.map"

# ckbcomp -model abnt -layout nativo -variant nativo > /usr/share/kbd/keymaps/i386/qwerty/nativo.map
cp nativo.map /usr/share/kbd/keymaps/i386/qwerty/
cp direita.map /usr/share/kbd/keymaps/i386/qwerty/
#ckbcomp -model abnt -layout nativo -variant original > /usr/share/kbd/keymaps/i386/qwerty/original.map
cp original.map /usr/share/kbd/keymaps/i386/qwerty/
#ckbcomp -model abnt -layout nativo -variant abnt2 > /usr/share/kbd/keymaps/i386/qwerty/abnt2.map
cp abnt2.map /usr/share/kbd/keymaps/i386/qwerty/

echo
echo "Mapa de teclado do console atualizado com sucesso!"
