# MSX-Works — estado e próximos passos

Última atualização: **9 de outubro de 2026**.

## Objetivo

Construir um ambiente integrado de produtividade para MSX2+ e MSX-DOS 2, com editor de textos como modo inicial e seleção futura de processador de textos, planilha e banco de dados pelo menu.

O editor terá o Norton Editor 2.0 como referência de funcionalidades. Ainda precisamos levantar e implementar as funções faltantes; não há paridade completa atualmente.

## Onde paramos

- [x] Verificação de MSX2+, DOS 2 e pelo menos 256 KB de RAM com mapper.
- [x] Interface de 80 colunas e menus drop-down controlados por SELECT, setas e Enter.
- [x] Menus File, Block, Text-layout, Search, Print, View, Options e HELP.
- [x] Edição básica: inserir, sobrescrever, apagar, unir e dividir linhas.
- [x] Navegação por palavras, começo/fim de linha e começo/fim do texto.
- [x] Rolagem horizontal e vertical, e Word Wrap visual opcional.
- [x] Barra de status e confirmação de descarte ao sair.
- [x] Armazenamento nos segmentos livres do mapper DOS 2, incluindo múltiplos slots.
- [x] Remoção do limite fixo de 8 KB e uso de posições de documento de 32 bits.
- [x] Atualização diferencial de texto, cursor e status, sem apagar a tela a cada tecla.
- [x] Correção do atraso causado pela varredura das 23 linhas da tela em cada edição simples.
- [x] Testes de digitação rápida para impedir que poucas escritas na VRAM escondam excesso de processamento.
- [x] README, licença e manual inicial com atalhos.

**Ponto de parada:** a digitação ficou mais rápida após a otimização, com melhora confirmada pelo usuário. A próxima prioridade proposta é abrir e salvar arquivos, para tornar o editor utilizável sem perder o trabalho ao sair.

### Evidências da última validação

- Build SDCC e testes locais em C passaram.
- 51 verificações de interface no openMSX passaram.
- Máquina com 256 KB: 80 KB disponíveis para o documento; texto de 72.000 bytes testado.
- Máquina com 512 KB e expansão de 512 KB: 848 KB disponíveis; texto de 360 KB testado entre mappers.
- Digitação em sequência no Z80 emulado: processamento de entrada e desenho em aproximadamente 6–8 ms por caractere nos cenários testados.
- Sequência de 30 caracteres: aproximadamente 173–207 ms, preservando a ordem e sem perdas.
- Testes verificam a liberação dos segmentos ao sair.

Esses números são resultados do emulador, não garantias para todas as máquinas. A capacidade depende da memória livre do DOS. Uma edição distante do ponto anterior ainda pode exigir movimentação proporcional de dados no gap buffer.

## Próximos passos propostos

### 1. Arquivos e preservação do trabalho

- [ ] Implementar File → New, Open, Save e Save As.
- [ ] Definir seleção de arquivo, nomes e caminhos aceitos no DOS 2.
- [ ] Ler e gravar em blocos, mantendo o documento nos segmentos do mapper.
- [ ] Definir conversão de finais de linha entre arquivo e representação interna.
- [ ] Mostrar o nome do arquivo na barra de status.
- [ ] Preservar o documento e o indicador de alteração quando ocorrer erro de leitura/gravação.
- [ ] Incluir salvar/cancelar/descartar ao sair ou substituir um documento alterado.

### 2. Funções do editor

- [ ] Levantar as funcionalidades do Norton Editor 2.0 e registrar as diferenças.
- [ ] Implementar seleção, cópia, recorte e colagem de blocos.
- [ ] Implementar busca e substituição.
- [ ] Definir e implementar desfazer/refazer.
- [ ] Expandir Text-layout e Options conforme o levantamento de funcionalidades.
- [ ] Implementar impressão.
- [ ] Atualizar o manual e a tabela de atalhos junto com cada nova função.

### 3. Desempenho e robustez

- [ ] Validar em hardware real, além do openMSX.
- [ ] Ampliar os testes de digitação rápida para Word Wrap, linhas longas e rolagem vertical.
- [ ] Medir edições distantes em documentos grandes e otimizar a movimentação do gap quando necessário.
- [ ] Continuar verificando que código e dados comuns ficam abaixo de `8000h`, fora da janela de paginação.
- [ ] Manter testes de memória cheia, falhas de alocação e liberação de segmentos.

### 4. Outros modos

- [ ] Definir formato de documentos e recursos do processador de textos.
- [ ] Desenvolver o modo de planilha.
- [ ] Desenvolver o modo de banco de dados.
- [ ] Integrar a troca de modo preservando os documentos e a experiência do usuário.

## Referências para retomar o desenvolvimento

| Arquivo | Responsabilidade |
|---|---|
| [msxworks.c](msxworks/msxworks.c) | Ambiente, teclado, menus e ciclo de vida da aplicação. |
| [editor.c](msxworks/editor.c) | Edição, navegação, viewport, caches e desenho incremental. |
| [document.c](msxworks/document.c) | Alocação do mapper, paginação e gap buffer do documento. |
| [screen.c](msxworks/screen.c) | Escritas na VRAM e atributos visuais. |
| [project_config.js](msxworks/project_config.js) | Módulos e configuração do build. |
| [tests](msxworks/tests) | Regressões locais e scripts do openMSX. |

Não chamar DOS/BIOS com uma janela de documento deixada no lugar da página original: os acessos ao texto são delimitados por `Document_Begin()` e `Document_End()`.

## Limitações atuais

- Não há abertura nem gravação em disco.
- O documento começa como `untitled`; sair descarta o conteúdo.
- Block, Search e Print ainda não têm funções implementadas.
- Word processor, Spreadsheet e Database são apenas entradas de menu com aviso de indisponibilidade.
- Campos de linha/coluna com quatro posições mostram `####` acima de 9999, sem limitar o tamanho do documento.

Veja também o [manual](manual.md) e a [apresentação do projeto](README.md).
