### Jogo: Rhythm Smasher

### Descrição:
Jogo de ritmo onde o jogador deve acertar as notas musicais que aparecem na tela no tempo certo. O jogo possui 3 níveis de dificuldade e 3 músicas diferentes.

### Resumo dos elementos e Mecânicas (17):
- **Notas**: São os elementos que aparecem na tela e que o jogador deve acertar no tempo certo.
- **Scores das notas**: As notas possuem 3 tipos de scores: **Ótimo**, **Bom** e **Ok**. O score **Ótimo** é o melhor score que o jogador pode conseguir valendo 3 pontos, o score **Bom** é um score intermediário que vale 2 pontos e o score **Ok** é o pior score que o jogador pode conseguir, valendo 1 ponto.
- **Combo**: O combo é um contador que aumenta a cada nota acertada e zera quando o jogador erra uma nota. O combo aumenta em 1 a cada nota acertada e é multiplicado pelo score da nota. Por exemplo, se o jogador acertar uma nota vermelha com score **Ótimo** e estiver com um combo de 5, ele ganhará 15 pontos (3 pontos do score da nota x 5 do combo).
- **Vida**: O jogador começa com 6 vidas e perde uma vida quando erra uma nota. O jogo acaba quando o jogador perde todas as vidas.
- **Barra de vida do boss**: O boss possui uma barra de vida que diminui quando o jogador acerta uma nota. O jogo acaba quando o jogador zera a barra de vida do boss. O jogador tem até o final da música para zerar a barra de vida do boss.
- **Contador de tempo**: O contador de tempo é um contador regressivo que começa com o tamanho da música e vai diminuindo até chegar a 0. O jogo acaba quando o contador de tempo chega a 0.
- **Score geral**: O score geral é a pontuação final do jogador. O score geral é calculado somando todos os pontos que o jogador ganhou durante a partida.
**Habilidades do boss**: O boss possuem habilidades especiais que podem ser usadas durante a partida. As habilidades são: **Aceitar notas**, **Zona de perigo**.
** Itens do Player**: O player pode coletar itens especiais que podem ser usados durante a partida. Os itens são: **Duplicador de combo**, **Invulnerabilidade** e **Golpe de dano**.


### Mecânicas:
- **Acertar notas**: O jogador deve acertar as notas que aparecem na tela no tempo certo. Para acertar uma nota, o jogador deve apertar a tecla correspondente à cor da nota quando ela estiver dentro da área de acerto. Existem três direções possíveis para as notas: **Cima**,**Direita** e **Esquerda**.
- **Randomização das notas**: As notas são geradas aleatoriamente e podem aparecer em qualquer uma das três direções.
- **Notas duplas**: As notas podem aparecer em pares, onde o jogador deve apertar duas teclas ao mesmo tempo para acertar as duas notas.
- **Velocidade das notas**: As fases variam a velocidade das notas, podendo ser mais rápidas ou mais lentas.


### Elementos de UI:
- **Janela de previsão de movimentação e area de ativação** -  mostra as
proximas sequencias e quando é possivel usar o comando de defesa



### NOTAS DE ATUALIZAÇÃO:
- **Versão 0.1** - 15/12/2023
  - Ajustado o tamanho da janela do jogo
  - Ajustado comportamento touch das notas, que antes não contabilizavam score e causava dano ao player
  - Ajustada dispersão do conteúdo do jogo, utilizando melhor o espaço da tela
  - Alteradas as musicas utilizadas no jogo para musicas mais temáticas (tema synthwave) e open source
  - Alterado o comportamento das notas,  para manter mais fiel possível o ritmo da música
  - nivelamento da dificuldade das musicas
  - Adicionado um novo nível de dificuldade e boss
  - Alterado a aparência do boss e do player, visando maior fidelidade ao tema do jogo
  - Adicionado "disparos" de nota ao acerto do player, para melhorar a sensação de acerto e dano ao boss
  - Adicionado indicativos de dano ao boss, informando o dano causado pelo player a cada acerto
  - Reformulação das artes e animações do jogo
  - Adicionada animações de transição entre as fases
  - Finalização do jogo ao fim do tempo da musica
  - Adicionado itens especiais que podem ser coletados e usados pelo player após derrotar os bosses
	- Duplicador de combo: duplica o combo atual do player
	  - Quando ativado, causa o efeito visual de mudança na cor das teclas, deixando-as azuis
	- Invulnerabilidade: torna o player invulnerável por um tempo
	  - Quando ativado, é monstrado o contador com o tempo para o fim da habilidade
	- Golpe de dano: causa dano ao boss
  - Adicionado habilidades especiais para o boss

  
