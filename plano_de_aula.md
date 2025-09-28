# 📘 Plano de Aulas Mikrotik — 10 Encontros

---

## 🧑‍🏫 Aula 01 — Introdução ao Mikrotik e Winbox

**Conteúdo:**
- Mikrotik, RouterBoard, RouterOS, SwitchOS
- Nomenclatura dos modelos (ex: RB750Gr3)
- 🔗 Documentação oficial de nomenclatura Mikrotik
- Tipos de versões: Stable vs Long Term
- Winbox: antes e depois do login
- Boas práticas iniciais (System/Users, IP/Services)
- Configuração de IP (estático, dinâmico, PPPoE)

**Desafio:** IP estático sem gateway → sem navegação  
✅ **Solução:** Adicionar gateway em IP > Routes

**Pergunta provocativa:**  
“Por que o Mikrotik pode estar acessível via MAC mas não via IP?”  
✅ **Resposta:** MAC usa camada 2, IP depende de configuração correta e rota válida

---

## 🧑‍🏫 Aula 02 — Interfaces e Bridge

**Conteúdo:**
- Interfaces físicas e virtuais
- Interface List e Bridge
- Adição de portas à bridge
- DHCP Server em bridge

**Desafio:** DHCP fora da bridge → sem distribuição  
✅ **Solução:** Adicionar interface à bridge e configurar DHCP nela

**Pergunta provocativa:**  
“Qual a diferença entre bridge e switch?”  
✅ **Resposta:** Bridge é lógica, switch é físico

---

## 🧑‍🏫 Aula 03 — DHCP, DNS, ARP

**Conteúdo:**
- DHCP Client e Server
- DNS interno e externo
- ARP: estático vs dinâmico

**Desafio:** DNS desativado → sem resolução de nomes  
✅ **Solução:** Ativar DNS em IP > DNS com servidores válidos

**Pergunta provocativa:**  
“O que acontece se o ARP estiver desativado?”  
✅ **Resposta:** Sem resolução de MAC → sem comunicação local  
✅ **Como ativar/desativar ARP:** Interfaces > ARP > escolher enabled, disabled, etc.

---

## 🧑‍🏫 Aula 04 — Firewall Básico

**Conteúdo:**
- Filter Rules: input, forward, output
- NAT: masquerade, dst-nat

**Desafio:** Bloquear porta 80 → sem acesso web  
✅ **Solução:** Criar regra em Filter > Input bloqueando TCP porta 80

**Pergunta provocativa:**  
“Por que o NAT é necessário em redes domésticas?”  
✅ **Resposta:** Para compartilhar um único IP público entre vários dispositivos

---

## 🧑‍🏫 Aula 05 — VPNs (WireGuard, PPTP, L2TP, SSTP, OVPN, IPsec)

**Conteúdo:**
- Conceito de VPN
- WireGuard: instalação, chaves, configuração
- PPTP, L2TP, SSTP: diferenças, segurança, compatibilidade
- OpenVPN (OVPN): configuração com certificados
- IPsec: conceito, uso corporativo, tunelamento seguro

**Criação de certificados autoassinados via CLI:**
```bash
/certificate add name=ca-template common-name=myCA key-size=2048 days-valid=3650
sign ca-template name=myCA
add name=server-template common-name=server key-size=2048 days-valid=3650
sign server-template ca=myCA name=server-cert
add name=client-template common-name=client key-size=2048 days-valid=3650
sign client-template ca=myCA name=client-cert
```
## 🔐 Comparativo de VPNs

| VPN       | Segurança | Compatibilidade | Throughput (Mbps) | Observações                          |
|-----------|-----------|-----------------|-------------------|--------------------------------------|
| WireGuard | Alta      | Alta            | 200–300           | Criptografia moderna, leve          |
| PPTP      | Baixa     | Alta            | 80–100            | Obsoleto, vulnerável                |
| L2TP      | Média     | Alta            | 100–150           | Usa IPsec como camada extra         |
| SSTP      | Alta      | Média           | 80–120            | Usa SSL, bom para redes restritas   |
| OVPN      | Alta      | Alta            | 100–200           | Flexível, usa certificados          |
| IPsec     | Alta      | Alta            | 150–250           | Corporativo, robusto, complexo      |

**Desafio:** VPN sem rota → sem acesso remoto  
✅ **Solução:** Adicionar rota estática via interface VPN

**Pergunta provocativa:**  
“Qual VPN é mais segura e por quê?”  
✅ **Resposta:** WireGuard e IPsec por usarem criptografia moderna e autenticação forte

---

## 🧑‍🏫 Aula 06 — CLI e Terminal

**Conteúdo:**
- Navegação básica no terminal
- Comandos equivalentes ao Winbox
- Scripts simples

**Desafio:** Script falha ao reiniciar interface  
✅ **Solução:** Corrigir sintaxe:
``` bash
/interface disable ether1
delay 5
/interface enable ether1
```
**Pergunta provocativa:**
“Por que usar CLI em vez de Winbox?” 
✅ **Resposta: CLI permite automação, acesso remoto e maior controle

---

## 🧑‍🏫 Aula 07 — Monitoramento e Logs

**Conteúdo:**
- Tools: Ping, Netwatch, IP Scan
- Graphing e SNMP
- Log: visualização e exportação

**Desafio:** Netwatch não reinicia interface
✅ **Solução:** Configurar ação correta nos campos “Up” ou “Down”

"Pergunta provocativa: “Como detectar queda de link automaticamente?” 
✅ **Resposta: Usar Netwatch para monitorar IPs e executar scripts

---

## 🧑‍🏫 Aula 08 — Backup e Segurança

**Conteúdo:**
- Backup: aberto vs fechado
- Reset Configuration
- Criptografia de backups
- Safe Mode: ativar para evitar perda de acesso
- Shodan.io: como encontrar Mikrotiks expostos
- Boas práticas de segurança:
- Alterar portas padrão (Winbox, SSH)
- Criar usuários com permissões mínimas
- Desativar serviços inseguros (Telnet, FTP)
- Usar VPN para acesso remoto
- Habilitar firewall para limitar acesso externo
- Monitorar logs e Netwatch
- Usar Safe Mode ao fazer mudanças críticas
- Verificar exposição no Shodan.io e corrigir

**Desafio:** Reset sem backup → perda total 
✅ **Solução:** Exportar configurações antes de resetar

"Pergunta provocativa: “Como evitar que seu Mikrotik apareça no Shodan?” 
✅ **Resposta: Desativar serviços inseguros, mudar portas padrão, usar firewall e VPN

---

## 🧑‍🏫 Aula 09 — Agendamentos e Scripts
**Conteúdo:**
- Scheduler: tarefas automáticas
- Scripts: comandos encadeados
- Exemplo: reiniciar PPPoE às 3h
- Script para agendamento:

bash
```
/system scheduler
add name="Reiniciar PPPoE" start-time=03:00:00 interval=1d \
on-event="/interface disable pppoe-out1; delay 5; /interface enable pppoe-out1"
```
**Desafio:** Script com erro de sintaxe → não executa 
✅ **Solução:** Validar comandos no terminal antes de salvar

"Pergunta provocativa: “Como automatizar atualizações com segurança?” 
✅ **Resposta: Usar scripts com verificação de versão e agendar em horários de baixo uso

---

## 🧑‍🏫 Aula 10 — Projeto Final e Simulação
**Conteúdo:**
- Montagem de rede completa
- Configuração de acesso remoto, VPN, DHCP, NAT
- Simulação de erros e correções

Avaliação prática

Script pronto para rede funcional:

bash
```
/interface bridge add name=bridge1
/interface bridge port add bridge=bridge1 interface=ether2
/interface bridge port add bridge=bridge1 interface=ether3
/interface bridge port add bridge=bridge1 interface=ether4

/ip address add address=192.168.88.1/24 interface=bridge1
/ip pool add name=dhcp_pool ranges=192.168.88.10-192.168.88.100
/ip dhcp-server add name=dhcp1 interface=bridge1 address-pool=dhcp_pool disabled=no
/ip dhcp-server network add address=192.168.88.0/24 gateway=192.168.88.1 dns-server=8.8.8.8

/ip firewall nat add chain=srcnat out-interface=ether1 action=masquerade

/interface wireguard add name=wg1 listen-port=13231 private-key="SEU_PRIVATE_KEY"
/interface wireguard peers add interface=wg1 public-key="CHAVE_DO_CLIENTE" \
allowed-address=10.0.0.2/32 endpoint-address=IP_DO_CLIENTE endpoint-port=13231
/ip address add address=10.0.0.1/24 interface=wg1
```
**Desafio: Falha de NAT → sem internet
✅ **Solução: Criar regra de masquerade correta
