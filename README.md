# TechXperience 🚀

Projeto pessoal para criação de ambientes de infraestrutura isolados utilizando Docker e Docker Compose, WordPress e MariaDB.  
Ambientes separados para **Desenvolvimento (Dev)**, **Homologação (Staging)** e **Produção (Prod)**.

![WordPress](https://upload.wikimedia.org/wikipedia/commons/thumb/9/98/WordPress_blue_logo.svg/250px-WordPress_blue_logo.svg.png)

## 📌 Visão Geral
Projeto pessoal com foco em praticar e integrar conhecimentos de:
- Docker & Docker Compose
- Redes (bridge, NAT, iptables)
- SSH com port forwarding
- Makefile e scripts automatizados
- Estruturação de ambientes Dev, Staging e Produção
- Versionamento de infraestrutura

## 📁 Estrutura do projeto
```bash
techXperience/
├── docker-compose.dev.yml
├── .env.dev
├── docker-compose.staging.yml
├── .env.staging
├── docker-compose.prod.yml
├── .env.prod
├── wordpress/
├── Makefile
├── scripts-infra/
│   ├── safe-iptables.sh
├── aprendizados/
│   ├── Projeto.md
└── README.md  # ← você está aqui!
```

## 🚀 Exemplo de como usar

### 1. Subir ambiente de desenvolvimento
```bash
make dev
```

### 2. Derrubar ambiente de desenvolvimento
```bash
make down-dev
```

### 3. Aplicar regra de iptables com backup

Foi criado um script para automação de backup e rollback para regras iptables, importante para o bom funcionamento da infraestrutura, salvo para uso no host e adicionado ao $PATH, podendo ser usado com o seguinte alias:
```bash
safe-iptables "iptables -A INPUT -p tcp --dport 8081 -j ACCEPT"
```

## 🔐 SSH
- Porta externa: `2222`
- Internamente redirecionado para a VM (192.168.xxx.xx:22)

## 🌐 WordPress Dev
- Porta: `8081`
- Acessível em: `http://localhost:8081` ou de outro PC em `http://192.168.x.xx:8081`

## 🧱 Ambientes
Cada ambiente possui containers e bancos **isolados**:

| Ambiente | Compose | Porta | Banco | .env |
|----------|---------|-------|-------|------|
| Dev      | docker-compose.dev.yml     | 8081  | `wordpress_dev` | `.env.dev` |
| Staging  | docker-compose.staging.yml | 8082  | `wordpress_staging` | `.env.staging` |
| Prod     | docker-compose.prod.yml    | 8080  | `wordpress_prod` | `.env.prod` |

## ✅ Checklist final
- [x] VM com IP fixo e rede configurada (virbr0)
- [x] SSH funcional fora e dentro do host
- [x] WordPress acessível em DEV
- [x] Makefile automatizado
- [x] Backups de iptables com rollback
- [x] VSCode com SSH remoto

## 🧠 Aprendizados salvos
Veja pasta `aprendizados/` para logs e reflexões técnicas reais

---

> Criado com sangue nos olhos e paixão por tecnologia. 💻🔥


## 📚 Estrutura dos Ambientes

| Ambiente | Porta | Containers |
|:--------:|:-----:|:----------:|
| Dev | 8081 | wordpress_app_dev, wordpress_db_dev |
| Staging | 8082 | wordpress_app_staging, wordpress_db_staging |
| Prod | 8080 | wordpress_app_prod, wordpress_db_prod |

Cada ambiente possui:
- Banco de dados MariaDB isolado
- Volume Docker persistente isolado
- Variáveis de ambiente específicas (.env)

---

## 📚 Como rodar o projeto

Clone o repositório:

```bash
git clone git@github.com:ju-c-lopes/techxperience.git
cd techxperience
