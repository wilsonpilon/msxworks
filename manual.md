# Manual do MSX-Works

Este manual descreve o protótipo atual. Funcionalidades planejadas não devem ser confundidas com opções já disponíveis.

> **Atenção:** abrir e salvar arquivos ainda não está implementado. O texto existe apenas na memória durante a execução. Ao sair, ele é descartado.

## 1. Inicialização

Execute `MSXWORKS` no MSX-DOS 2.

O programa exige MSX2+ e pelo menos 256 KB de RAM com mapper. A tela inicial mostra a versão do sistema e informações de memória. Pressione **Enter** ou **Esc** para fechar o relatório e entrar no editor.

Se o ambiente não atender aos requisitos, o programa apresenta o relatório no console e retorna ao DOS.

## 2. Editor de textos

O editor é sempre o modo inicial. Um documento novo aparece como `untitled`, com:

- Modo **Insert**: caracteres novos deslocam o texto seguinte.
- **WW=Off**: Word Wrap visual desligado.
- Cursor no começo do texto.

Digite normalmente para inserir caracteres. **Enter** divide a linha na posição do cursor. **Backspace** apaga o caractere anterior e, no começo de uma linha, une-a à anterior. **Delete** apaga o caractere seguinte e pode unir linhas ao apagar a quebra.

**Tab** insere espaços até a próxima parada de oito colunas. Não armazena um caractere de tabulação.

No modo **Over**, caracteres digitados substituem os existentes. Ao chegar ao fim da linha, a digitação acrescenta caracteres; não sobrescreve a quebra de linha.

O documento utiliza os segmentos livres do mapper disponibilizados pelo DOS 2. Não há um teto fixo de 8 KB. Quando não houver mais espaço, o programa apresenta um aviso de memória cheia.

## 3. Barra de status

Na última linha da tela:

| Campo | Significado |
|---|---|
| Seta à esquerda e à direita | Marcadores nas extremidades da barra. |
| `*` na terceira coluna | O documento foi modificado. Em um texto novo não alterado, o campo fica vazio. |
| `Line=0001` | Número da linha lógica, começando em 1. |
| `Col=0001` | Coluna na linha lógica, começando em 1. |
| `untitled` | Nome provisório do documento; arquivos ainda não estão implementados. |
| `Insert` / `Over` | Inserção ou sobrescrita. |
| `WW=Off` / `WW=On` | Estado do Word Wrap visual. |

Linha e coluna têm quatro posições. Valores acima de 9999 aparecem como `####`; isso não limita a navegação nem o tamanho do texto.

## 4. Menus

Pressione **SELECT** para abrir ou fechar os menus. Use as setas esquerda/direita para escolher o menu e cima/baixo para escolher uma opção. **Enter** executa a opção; **Esc** fecha o menu.

| Menu | Estado atual |
|---|---|
| **File → Exit** | Sai do programa; pede confirmação se houver texto alterado. |
| **Block** | Ainda não implementado. |
| **Text-layout → Word Wrap** | Alterna a quebra visual de linhas. |
| **Search** | Ainda não implementado. |
| **Print** | Ainda não implementado. |
| **View → Text editor** | Mantém o editor ativo. |
| **View → Word processor** | Exibe aviso de indisponibilidade e mantém o editor. |
| **View → Spreadsheet** | Exibe aviso de indisponibilidade e mantém o editor. |
| **View → Database** | Exibe aviso de indisponibilidade e mantém o editor. |
| **Options → Insert / Over** | Alterna inserção e sobrescrita. |
| **HELP → About** | Mostra informações do programa. |

### Word Wrap

O Word Wrap é apenas visual: distribui a linha pela largura da tela, preferindo espaços quando possível, sem inserir quebras no documento. Com Word Wrap desligado, linhas longas usam rolagem horizontal.

Os números de linha e coluna continuam representando a linha lógica do texto, não cada linha visual.

## 5. Teclas de atalho

### Edição e navegação

| Tecla | Ação |
|---|---|
| **← / →** | Move um caractere para a esquerda/direita. |
| **↑ / ↓** | Move para a linha visual anterior/seguinte, procurando manter a coluna. |
| **Ctrl + ←** | Vai ao começo da palavra anterior ou da palavra atual, conforme a posição. |
| **Ctrl + →** | Avança até a próxima palavra, ou até o fim do documento. |
| **Home** | Vai ao começo da linha lógica atual. |
| **STOP** | Vai ao fim da linha lógica atual. |
| **Ctrl + Home** | Vai ao começo do documento. |
| **Ctrl + STOP** | Vai ao fim do documento, sem sair do programa. |
| **Enter** | Insere uma quebra de linha na posição do cursor. |
| **Tab** | Insere espaços até a próxima parada de oito colunas. |
| **Backspace** | Apaga o caractere anterior; pode unir linhas. |
| **Delete** | Apaga o caractere seguinte; pode unir linhas. |
| **Insert** | Alterna os modos Insert e Over. |

A navegação por palavras considera letras, números e `_` como parte das palavras; espaços, pontuação e quebras de linha atuam como separadores. Caracteres com código a partir de 128 também são tratados como parte de palavras.

### Menus e diálogos

| Tecla | Ação |
|---|---|
| **SELECT** | Abre/fecha a barra de menus. |
| **← / →**, com menu aberto | Troca o menu principal. |
| **↑ / ↓**, com menu aberto | Troca a opção selecionada. |
| **Enter**, com menu aberto | Executa a opção selecionada. |
| **Esc**, com menu aberto | Fecha o menu. |
| **Enter / Esc**, em avisos | Fecha o aviso. |
| **← / →**, na confirmação de saída | Alterna Cancel / Discard. |
| **Enter**, na confirmação de saída | Confirma a escolha. |
| **Esc / SELECT**, na confirmação de saída | Cancela a saída. |

Não há atalhos de abertura, gravação, busca ou operações de bloco nesta versão.

## 6. Sair do programa

Abra **File → Exit**.

Se o texto tiver sido alterado, a confirmação começa em **Cancel**. Escolha **Discard** apenas se quiser descartar o documento. Não existe opção de salvar nesta versão.

Ao sair, o programa libera os segmentos alocados e restaura a tela do DOS.

## 7. Desenvolvimento

Veja o [README](README.md) para requisitos, compilação e testes, e o [outline](outline.md) para o ponto de parada e próximos passos.
