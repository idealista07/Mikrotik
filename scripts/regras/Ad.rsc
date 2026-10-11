#Regras para AD
/ip firewall layer7-protocol
add name=[DOMINIO] regexp=[DOMINIO]
/ip firewall nat
add action=dst-nat chain=dstnat comment="DNS para AD - Redirect UDP" dst-address=[IP_MK] dst-port=53 layer7-protocol=[REGRA_LAYER7] protocol=udp to-addresses=[IP_DOMINIO] to-ports=53
add action=src-nat chain=srcnat comment="DNS para AD - SNAT UDP" dst-address=[IP_DOMINIO] dst-port=53 protocol=udp to-addresses=[IP_MK]
