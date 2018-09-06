# Tutorial de vim

## Sumário

- [Configurando o vim](#config)
- [Entrar e sair do vim](#entrar)
- [Modo de inserção](#insert)
- [Modo normal](#normal)
- [Movimentação](#move)
- [Busca](#busca)
- [Desfazer](#undo)
- [Copiar e colar](#copiar)
- [Observações](#obs)
- [Referências](#ref)

<a name="config"></a>
## Configurando o vim (opcional)

Os seguintes comandos instalam plugins para o vim, permitindo o uso de mouse e melhorando a UI.

Abra o terminal e execute o seguinte comando:

```Bash
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

Abra o arquivo ~/.vimrc

```Bash
vim ~/.vimrc
```

Então, copie os comandos do arquivo [.vimrc](.vimrc) para lá.

Pressione **ESC** e então **:PlugInstall** e depois enter. Isso irá instalar alguns plugins. Ao terminar, saia do vim (ESC e depois :wq).

<a name="entrar"></a>
## Entrar e sair do vim

Para abrir um arquivo ou criar um novo:

```bash
vim <arquivo>
```

Para sair sem salvar, pressione **ESC** e depois **:q!**

Para salvar e sair, pressione **ESC** e depois **:wq**

<a name="insert"></a>
## Iniciar modo de inserção

O modo de inserção é o modo no qual o vim funciona como um editor de texto comum. Ou seja, ao pressionar qualquer tecla, ela é escrita no arquivo.

Para iniciar o modo de edição temos algumas opções:

- **i** - Entra no modo de inserção no lugar em que o cursor se encontra
- **I** - Entra no modo de inserção no primeiro caracter (não branco)
- **s** - deleta o caracter sob o cursor e entra no modo de inserção
- **S** - Apaga a linha atual e entra no modo de inserção
- **C** - Apaga a linha a partir da posição do cursor e entra no modo de inserção
- **a** - Entra no modo de inserção após o cursor
- **A** - Entra no modo de inserção no fim da linha
- **o** - Cria linha abaixo e entra no modo de inserção
- **O** - Cria linha acima e entra no modo de inserção

<a name="normal"></a>
## Modo normal

Este é o modo em que o vim se encontra ao ser aberto. Para voltar à ele após entrar no modo de inserção, basta pressonar ESC.

<a name="move"></a>
## Movimentação

Uma vez no modo normal, pode executar os seguintes comandos:

- **w** - Avança para o início da próxima palavra (não considera só espaço como divisor de palavras)
- **W** - Avança para o início da próxima PALAVRA (considerando só espaço como divisor de palavras)
- **b** - Volta para o início da última palavra
- **B** - Volta para o início da última PALAVRA
- **e** - Avança para o fim da próxima palavra
- **E** - Avança para o fim da próxima PALAVRA
- **gg** - vai para o topo do arquivo
- **G** - vai para o fim do arquivo
- **0** - vai pro inicio da linha
- **^** - vai para o primeiro caracter (não branco) da linha
- **$** - vai para o ultimo caracter da linha

<a name="busca"></a>
## Busca

Uma vez no modo normal, pode executar os seguintes comandos:

- **/\<palavra ou regex>** - busca a partir do local do cursor, a palavra ou regex informada
- **?\<palavra ou regex>**  - busca do local do cursor para trás
- **\*** - busca ocorrências da palavra sob o cursor até o fim do arquivo  (bounded - busca exatamente a palavra, ou seja, ela não pode estar contida em outra maior)
- **g\*** - busca ocorrências da palavra sob o cursor até o fim do arquivo  (unbounded - a palavra pode estar contida em outra maior)
- **\#**  - igual a *, mas olhando para trás
- **g#** - igual a g*, mas olhando para trás

Após fazer a busca, pode navegar entre os resultados:

- **n**  - Próximo resultado
- **N**  - Resultado anterior

<a name="undo"></a>
## Desfazer

Uma vez no modo normal, pode executar os seguintes comandos:

- **u** - undo
- **ctrl+r** - redo

<a name="copiar"></a>
## Copiar e colar

Uma vez no modo normal, pode executar os seguintes comandos:

- **y** - (yank) copia - usar junto com os caracteres de movimentação (ex: yw copia uma palavra)
- **yy** - copia a linha inteira
- **p** - cola depois do cursor
- **P** - cola após o cursor

Também é possível entrar no modo visual (apertando **v**) e selecionar (com o teclado) o texto a ser copiado. Feito isso, basta apertar **y** para copiar.

Para voltar ao modo normal, basta pressionar **ESC**.

<a name="obs"></a>
## Observações

- Se você realizou as configurações do início desse tutorial, ao selecionar um texto com o mouse, o vim entrará automaticamente no modo visual.

- Ao fazer o "yank" do texto ele só poderá ser colado dentro do vim. Para copiar ele para o clipboard e usar fora do vim, selecione o texto e aperte ctrl+c ou clique com o botão direito (se você fez as configurações)

- Quase todas as operações aceitam um número antes dela. Por exemplo, 3w avança 3 palavras, 5yy copia 5 linhas...

- Os comandos podem e devem ser combinados. Por exemplo, **ggvGy** vai para o início do arquvo, muda para o modo visual, avança até o fim do arquivo, selecionando tudo, e copia.

<a name="ref"></a>
## Referências

- [Vim - training class 1](https://www.youtube.com/watch?v=Nim4_f5QUxA&t=1787s&frags=pl%2Cwn)

