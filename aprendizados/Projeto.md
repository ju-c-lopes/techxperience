# Projeto Blog com Wordpress Docker - Infraestrutura de Virtualização e Port Forwarding

Autor: Juliano Lopes<br>
Data: Abril de 2025<br>
Objetivo: Estruturar e configurar uma infraestrutura de máquina virtual (VM) utilizando Virt-Manager (libvirt/KVM) com rede NAT (virbr0), configuração avançada de iptables, e implementação de port forwarding para SSH e HTTP.

## 🖥️ Ambiente e Tecnologias Utilizadas

-   Debian Server 12 (Host)

-   Virt-Manager / Libvirt / QEMU / KVM

-   IPtables _(Firewall e NAT Linux)_

-   tcpdump _(Analisador de pacotes de rede)_

-   DHCP _(via libvirt NAT)_

-   SSH Server (sshd) na VM

-   Modelo de rede NAT _(virbr0)_

-   Conceitos de TCP/IP, NAT, DNAT, PREROUTING, FORWARDING

-   Modelo de Redes Virtuais (Bridge, Macvtap)

## 🚀 Resumo da Jornada Técnica

1. Criação da Máquina Virtual,
   Instalação do Debian Server no `virt-manager`.

Definição de interface de rede `virbr0`.

Configuração de IP dinâmico via DHCP no ambiente virbr0 _(libvirt NAT)_.

2. Diagnóstico e Problemas Identificados

    - **Problema**:

    A máquina virtual não conseguia receber conexões externas através de forwarding da porta 2222 para SSH e da porta 8080 para HTTP.

### 🔧 Ferramentas de diagnóstico utilizadas:

<u>**journalctl**</u> para monitoramento de conexões no serviço sshd.

<u>**tcpdump**</u> para captura e análise de pacotes na interface de rede.

<u>**iptables**</u> para auditoria das chains PREROUTING, FORWARD e INPUT.

### 📝 Constatação técnica:

Pacotes **SYN** chegavam ao host na porta 2222 (confimado com **tcpdump**).

NAT PREROUTING existentes e configurados corretamente (iptables -t nat -L PREROUTING -n -v).

Problemas mapeados na cadeia FORWARD e INPUT do iptables (pacotes não eram encaminhados corretamente para a VM).

3. Soluções Implementadas

Liberação da porta 2222 no INPUT do Host:

Permissão explícita de FORWARD para a VM (SSH na porta 22):

Configuração do NAT para saída da VM para internet:

Configuração do DNAT (port forwarding de entrada):

## 🧠 Conceitos Técnicos Aplicados

-   NAT (Network Address Translation)

-   PREROUTING (iptables NAT table): Redirecionamento de pacotes antes de o Host decidir roteá-los.

-   FORWARD (iptables filter table): Permitir que pacotes NATeados sejam realmente encaminhados até o destino.

-   MASQUERADE: Técnica de mascarar o IP de saída das VMs para acessar a internet.

-   Conntrack (RELATED, ESTABLISHED): Estados de conexões analisados para liberar tráfego já iniciado.

-   Virt-Manager vs VirtualBox (Implementação Real de Bridge vs Simulação de Bridge)

-   Entendimento profundo das limitações de redes Wi-Fi em bridges reais.

## 📚 Conclusão Técnica

Este projeto permitiu aprender niveis avançados, com domínio sobre:

-   Infraestrutura de virtualização Linux.

-   Configuração avançada de redes virtuais.

-   Manipulação manual de firewall iptables.

-   Diagnóstico de problemas de rede reais em ambiente de produção.

Essa jornada consolidou conhecimento prático e teórico de infraestrutura Linux e redes TCP/IP, elementos fundamentais para carreiras de _DevOps, SysAdmin e Arquitetura de Sistemas_.

## 🚀 Resultado final

VM acessível por SSH externo (ssh usuario@ip-host -p 2222).

Acesso HTTP pela porta 8080 para web services.

Internet funcional para a VM via NAT.

Host Debian seguro e controlado.

---

_"Toda a dificuldade enfrentada na jornada representou crescimento técnico real, desenvolvendo não apenas habilidades técnicas, mas também resiliência profissional."_

— Juliano Lopes
