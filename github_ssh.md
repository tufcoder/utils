# COMO GERAR CHAVE SSH PARA O GITHUB

## Índice

1. [Verificar se a chave já existe](#verificar-se-a-chave-já-existe)
1. [Gerando uma nova chave SSH](#gerando-uma-nova-chave-ssh)
1. [Visualizando a chave pública](#visualizando-a-chave-pública)
1. [Adicionando a chave privada no SSH-AGENT](#adicionando-a-chave-privada-no-ssh-agent)
1. [Adicionar a chave pública no Github](#adicionar-a-chave-pública-no-github)
1. [Teste sua conexão SSH com o Github](#teste-sua-conexão-ssh-com-o-github)
1. [Solucionar problemas](#solucionar-problemas)

## Verificar se a chave já existe

No **Terminal** ou **GitBash** executar o comando **`ls -la ~/.ssh`** para listar as chaves já existentes. Caso nenhum arquivo seja mostrado, você precisa gerar uma nova chave ssh.

Caso já exista uma chave, você pode verificar se ela é compatível com o Github sendo uma chave do tipo SHA256.
- **`SHA256:nThbg6kXUpJWGl7E1IGOCspRomTxdCARLviKw6E5SY8`** (RSA)
- **`SHA256:p2QAMXNIC1TJYWeIOttrVc98/R1BUFWu3/LiyKgUfQM`** (ECDSA)
- **`SHA256:+DiY3wvvV6TuJJhbpZisF/zLDA0zPMSvHdkr4UvCOqU`** (Ed25519)

[Fonte](https://docs.github.com/pt/authentication/keeping-your-account-and-data-secure/githubs-ssh-key-fingerprints)

## Gerando uma nova chave SSH

Aqui será gerado um novo par de chaves. É um par porque trata-se de uma **chave pública e uma privada**, resultando em dois arquivos. A **`chave pública (*.pub)`** é a chave que vamos **adicionar no Github**.

Para criar um novo par de chaves RSA, execute o comando:

```sh
# Não precisa copiar o símbolo "$" do começo
$ ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
```

Isso cria um novo par de chaves ssh, usando o email fornecido como parte da chave. Caso seja pedido um file (arquivo) para salvar a nova chave e uma passphrase, não precisa fazer nada, só aperte **`ENTER`** até acabar as perguntas.

Pronto, seu novo par de **chaves RSA** foi criado no diretório **`~/.ssh/`**

## Visualizando a chave pública

Aqui você pode ver sua chave pública ao executar o comando:

```sh
# Não precisa copiar o símbolo "$" do começo
$ cat ~/.ssh/id_rsa.pub
```

## Adicionando a chave privada no SSH-AGENT

Verifique se o ssh-agent está em execução, execute o comando abaixo:

```sh
# Não precisa copiar o símbolo "$" do começo
$ eval "$(ssh-agent -s)"
# Retorna o pid
> Agent pid XXXXX
```

Adicione a chave privada no ssh-agent, execute o comando:

```sh
# Não precisa copiar o símbolo "$" do começo
$ ssh-add ~/.ssh/id_rsa
```

## Adicionar a chave pública no Github

Agora que você tem uma chave pública, basta entrar no Github e ir em: **`Settings > SSH and GPG keys > New SSH Key`**.
Vai aparecer dois campos, "Título" e "Chave".

[Fonte](https://docs.github.com/pt/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account)

Adicione a chave pública no campo "Chave" e no campo "Título" dê um nome significativo, por exemplo "rsa-gitbash_win10".

Eu gosto de seguir esse padrão **`<tipo_chave-terminal_sistema>`** porque posso ter várias sabendo o tipo e onde foi gerado:

> rsa-gitbash_win10  
> rsa-wsl_ubuntu  
> rsa-zsh_arch  
> ecdsa-bash_debian  
> ed25519-wsl_mint  
> dsa-gitbash_win10 *(depreciado)*

Clique no botão **`"Add SSH Key"`**, se for solicitado, confirme sua senha e pronto!

## Teste sua conexão SSH com o Github

```sh
# Não precisa copiar o símbolo "$" do começo
$ ssh -T git@github.com
```

Se aparecer algo como:

```
Hi <github_username>! You've successfully authenticated, but GitHub does not provide shell access.
```

Está tudo certo com a sua conexão, então só fazer o fluxo normal no GitHub.

## Solucionar problemas

Aqui deixo um link para o **[GitHub Docs](https://docs.github.com/pt/authentication/troubleshooting-ssh)** contendo links úteis.