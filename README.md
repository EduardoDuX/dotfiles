# 🛠️ My Dotfiles

Repositório pessoal com minhas configurações de ambiente e Linux.

---

## 🗂️ O que está incluído?

* **Window Manager / Compositor:** Hyprland / Sway / i3
* **Terminal & Shell:** Zsh, Starship, Kitty / Alacritty
* **Editores de Texto:** Neovim / VS Code
* **Ferramentas de Sistema:** Rofi, Waybar, Dunst

---

## ⚙️ Como Funciona?

Este repositório é gerenciado utilizando a técnica de **Git Bare Repository**. Isso permite que os arquivos de configuração permaneçam em seus diretórios originais (como `~/.config/` ou `~/`) sem a necessidade de links simbólicos (symlinks).

O alias utilitário utilizado para gerenciar as configurações é:

```bash
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
```

---

## 🚀 Instalação em uma Nova Máquina

Se você está configurando este ambiente do zero em uma nova máquina, siga os passos abaixo:

### 1. Clonar o repositório como Bare Repository
```bash
git clone --bare https://github.com/EduardoDux/dotfiles.git $HOME/.cfg
```

### 2. Definir o alias temporariamente no terminal atual
```bash
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
```

### 3. Fazer o checkout das configurações para a Home
```bash
config checkout
```

> **Nota:** Caso você já tenha arquivos de configuração padrão no sistema, o comando acima retornará um erro por conta de conflitos. Para resolver, faça backup ou remova os arquivos existentes conflitantes e rode o checkout novamente.

### 4. Ocultar arquivos não rastreados no terminal
Para evitar que o `git status` monitore todos os arquivos não versionados do seu diretório `$HOME`:
```bash
config config --local status.showUntrackedFiles no
```

---

## 💻 Uso no Dia a Dia

Para adicionar, commitar e enviar novas alterações de configuração para o GitHub, utilize o alias `config` da mesma forma que usaria o comando `git`:

```bash
# Adicionar um novo arquivo de configuração
config add ~/.config/hypr/hyprland.conf

# Criar um commit
config commit -m "style: atualiza cores do hyprland"

# Enviar as alterações
config push
```
