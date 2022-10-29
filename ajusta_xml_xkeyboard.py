#!/usr/bin/env python3

from lxml import etree

def _ajusta_xml(nome_original):
    #
    # Abre o XML original
    #
    original = open(f'/usr/share/X11/xkb/rules/{nome_original}.xml').read()
    xml_original = etree.fromstring(original.encode('utf-8'))
    noh_original = xml_original.xpath("//layout//configItem//name[text()='br']")[0].getparent().getparent()

    #
    # Abre o XML nativo (com alguns ajustes)
    #
    nativo = open('/home/ari/base/teclado/nativo.xml').read()
    nativo = nativo.replace('>nativo<', '>br<', 1)
    nativo = nativo.replace('>Nativo - abnt2', '>Brasil - ABNT2')
    nativo = nativo.replace('>Nativo', '>Brasil - Nativo')
    xml_nativo = etree.fromstring(nativo.encode('utf-8'))
    noh_nativo = xml_nativo.xpath("//layout//configItem//name[text()='br']")[0].getparent().getparent()

    #
    # Substitui os nós original e evdev pelo nativo
    #
    noh_original.getparent().replace(noh_original, noh_nativo)

    #
    # Agora, a geometria
    #
    try:
        noh_original = xml_original.xpath("//model//configItem//name[text()='abnt']")[0].getparent().getparent()
        noh_nativo = xml_nativo.xpath("//model//configItem//name[text()='abnt']")[0].getparent().getparent()
        noh_original.getparent().replace(noh_original, noh_nativo)
    except:
        noh_original = xml_original.xpath("//model//configItem//name[text()='pc105']")[0].getparent().getparent()
        noh_nativo = xml_nativo.xpath("//model//configItem//name[text()='abnt']")[0].getparent().getparent()
        noh_original.getparent().append(noh_nativo)

    #
    # Salva o arquivo original ajustado
    #
    original = etree.tounicode(xml_original)
    open(f'/usr/share/X11/xkb/rules/{nome_original}.xml', 'w').write(original)

    #
    # Agora o arquivo sem extensão
    #
    original = open(f'/usr/share/X11/xkb/rules/{nome_original}', 'r').read()

    texto_base = '\n! model\t\t=\tgeometry\n'

    partes = original.split(texto_base)

    if not partes[1].startswith('  abnt = abnt(abnt)\n'):
        partes[1] = '  abnt = abnt(abnt)\n' + partes[1]

    nativo = partes[0] + texto_base + partes[1]
    open(f'/usr/share/X11/xkb/rules/{nome_original}', 'w').write(nativo)

    #
    # E, por fim, o arquivo lst
    #
    original = open(f'/usr/share/X11/xkb/rules/{nome_original}.lst', 'r').read()

    texto_base = '! model\n'

    partes = original.split(texto_base)

    if not partes[1].startswith('  abnt            Brazilian ABNT\n'):
        partes[1] = '  abnt            Brazilian ABNT\n' + partes[1]

    nativo = partes[0] + texto_base + partes[1]
    open(f'/usr/share/X11/xkb/rules/{nome_original}.lst', 'w').write(nativo)



_ajusta_xml('base')
_ajusta_xml('evdev')
