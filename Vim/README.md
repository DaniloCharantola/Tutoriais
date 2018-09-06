# Tutorial de vim

## Sumário

- [Configurando o vim](#config)
- [Entrar e sair do vim](#entrar)
- [Modo de inserção](#insert)
- [Modo normal](#normal)
- [Movimentação](#move)
- [Busca](#busca)
- [Desfazer e refazer](#undo)
- [Copiar e colar](#copiar)
- [Deletar](#delete)
- [Substantivos](#substantivos)
- [Regex](#regex)
- [Range](#range)
- [Substitute (replace)](#replace)
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
- **h** - vai para esquerda
- **j** - vai para baixo
- **k** - vai para cima
- **l** - vai para direita

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
## Desfazer e refazer

Uma vez no modo normal, pode executar os seguintes comandos:

- **u** - undo
- **ctrl+r** - redo
- **.** - aplica a ultima operação realizada. Por exemplo, se a última operação realizada foi remover uma palavra, ao aplicar esse comando, apagará a palavra após o cursor.

<a name="copiar"></a>
## Copiar e colar

Uma vez no modo normal, pode executar os seguintes comandos:

- **y** - (yank) copia - usar junto com os caracteres de movimentação (ex: yw copia uma palavra)
- **yy** - copia a linha inteira
- **p** - cola depois do cursor
- **P** - cola após o cursor

Também é possível entrar no modo visual (apertando **v**) e selecionar (com o teclado) o texto a ser copiado. Feito isso, basta apertar **y** para copiar.

Para voltar ao modo normal, basta pressionar **ESC**.

<a name="delete"></a>
##Deletar

- **d** - deleta (precisa de mais alguma informação, um substantivos)
- **dd** - deleta uma linha

<a name="substantivos"></a>
## Substantivos

- **iw** - inner word - palavra na qual o cursor se encontra
- **it** - inner tag - tag html na qual o cursor se encontra
- **i"** - inner quotes - o que está entre aspas
- **i)** - o que está entre parenteses
- **ip** - inner pararaph
- **as** - a sentence

- **f<caracter>** - find - procura o caracter para frente e para exatamente nele
- **F<caracter>** - find - procura o caracter para trás e para exatamente nele
- **t<caracter>** - unTill - procura o caracter para frente e para logo antes dele
- **T<caracter>** - unTill - procura o caracter para trás e para logo antes dele

<a name="regex"></a>
## Regex

Para representar uma palavra específica, por exemplo "asa", basta digitar os caracteres asa normalmente e ele irá encontrar todas as ocorrências de "asa", inclusive dentro da palavra "casa", por exemplo. Para buscar somente ocorrências exatas, tem que fazer:

**\\\<asa\\>**.

**\\\<** - irá impedir de ter qualquer coisa antes de "asa".

**\\>** - irá impedir de ter qualquer coisa depois de "asa".

### "Escaped" characters ou metacharacters

- **.** - qualquer caracter, menos nova linha
- **\s** - espaço ou tab
- **\_s** - espaço, tab	 ou "_"
- **\d** - qualquer número
- **\x** - qualquer número hexadecimal
- **\o** - qualquer número octal
- **\h** - head of word (a,b,c...z,A,B,C...Z and _)
- **\w** - qualquer caracter de uma palavra
- **\a** - qualquer letra do alfabeto
- **\l** - qualquer caracter minúsculo
- **\u** - qualquer caracter maiúsculo
- **^** - início da linha
- **$** - fim da linha

Todos os comandos acima têm uma versão correspondente com letra maiúscula, que corresponde à negação da versão em letra minúscula. Por exemplo, **\D** representa qualquer caracter que não é um dígito.

### Quantificadores

- **\*** - indica 0 ou mais ocorrências do que o precede. Por exemplo **.\*** corresponde a qualquer sequencia de caracteres em uma linha.
- **\\+** - indica uma ou mais ocorrência do que o precede
- **\\=** - indica 0 ou 1 ocorrência do que o precede
- **\\{n,m}** - entre n e m ocorrências do que o precede. Se n não for informado, irá assumir que é 0. Se m não for informado, irá supor infinito.
- **\\{n}** - exatamente n ocorrências

Os quantificadores acima são "gananciosos", então irão consumir a maior cadeia de caracteres possível. Por exemplo, no texto:

*Esse "texto" será usado no "exemplo".*

Ao pesquisar a regex **".\*"**, ele vai reconhecer da primeira aspas até a última: **texto" será usado no "exemplo**.

Para reconhecer apenas **texto**, teria que reconhecer de forma não gananciosa:

- **\{-}** - indica 0 ou mais ocorrências do que o precede (o mínimo de caracters possível).

### Range de caracters

- **[a-z]** - letras minúsculas
- **[A-Z]** - letras maiúsculas
- **[0-9]** - números
- **[a-zA-Z0-9]** - letras ou números
- **[^a-z]** - **^**, no início, serve como negação. Então serve para qualquer coisa que não é letra minúscula.

### Grupos

É possível agrupar as expressões usando parênteses: **\\(** e **\\)**

### And e Or

- **|** - retorna true se tiver o caracter/grupo precedente ou posterior.
- **&** - retorna true se tiver o caracter/grupo precedente e posterior.

<a name="range"></a>
## Range

Range retorna um pedaço do arquivo sobre o qual uma operação deve ser aplicada. Os principais comandos de range são:

- *<number* - escrever realmente o número de uma linha
- **.** - a linha atual
- **$** - última linha do arquivo
- **%** - o arquivo inteiro.
- **/pattern** - próxima linha que bate com o pattern
- **?pattern** - a linha anterior que bate com o pattern
- **\/** - a próxima linha que bate com a última busca realizada
- **\?** - a linha anterior que bate com a última busca realizada
- **\&** - a próxima linha que bate com o último padrão usado no substitute

### Vírgula

Ao usar uma vírgula o range será tudo entre o que está antes da vírgula e o que está depois. Por exemplo, **1,$** pega o arquivo inteiro.

### Ponto e vírgula

Encontra o que está a esquerda e depois faz o que está a direita. Por exemplo:

 **/Section 1/;/Subsection 1/-,/Subsection 2/+**

 Vai até a seção 1 e depois pega tudo entre a sub seção 1 e subseção 2

<a name="replace"></a>
## Substitute (replace)

Primeiramente, entre no modo de comando pressionando **:** a partir do modo normal. Feito isso, a sintaxe do comando substitute é dada por:

**[range]s/\<regex>/\<string>/[cgiI]**

Este comando irá ser aplicado no range informado (opicional) e substituirá coisas compatíveis com a regex1 pela string informada, com as opções [cgiI].

Veja a seção específica de [range](#range) e [regex](#regex).

### String de replace do comando substitute

A string no comando substitute possui alguns caracteres especiais:

- **\\1** - Dada a string que deu match com a regex no comando substitute, este caracter irá pegar a parte dessa string que deu match com o primeiro grupo da regex.
- **\\2** - Análogo ao anterior. Pega o segundo grupo.
- **&** - Toda a string que deu match com a regex.
- **~** - A última string de substituição usada.

Exemplo:

Para colocar a primeira palavra entre aspas:

:s/**\\(\\w\\+\\)\\(.\*\\)**/"**\\1**"**\\2**

> **\\(\\w\\+\\)** irá identificar uma palavra.

> **\\(.\*\\)** irá identificar qualquer coisa.

> **\\1** vai ser substituído pelo primeiro grupo (a palavra encontrada).

> **\\2** vai ser substituído pelo segundo grupo (o restante da linha).

<a name="obs"></a>
## Observações

- Se você realizou as configurações do início desse tutorial, ao selecionar um texto com o mouse, o vim entrará automaticamente no modo visual.

- Ao fazer o "yank" do texto ele só poderá ser colado dentro do vim. Para copiar ele para o clipboard e usar fora do vim, selecione o texto e aperte ctrl+c ou clique com o botão direito (se você fez as configurações)

- As operações possuem a seguinte sintaxe: [n] verbo <substantivo>, onde n é um número opicional. Por exemplo, 3dw irá deletar 3 palavras.

- Os comandos podem e devem ser combinados. Por exemplo, **ggvGy** vai para o início do arquvo, muda para o modo visual, avança até o fim do arquivo, selecionando tudo, e copia.

<a name="ref"></a>
## Referências

- [Vim - training class 1](https://www.youtube.com/watch?v=Nim4_f5QUxA&t=1787s&frags=pl%2Cwn)
- [Mastering the vim language](https://www.youtube.com/watch?v=wlR5gYd6um0&frags=pl%2Cwn)
- [Configurações do vim](https://github.com/caio96/dot-files/blob/master/.vimrc)