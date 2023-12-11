### Jogo: Rhythm Smasher

### Descrição:
Jogo de ritmo onde o jogador deve acertar as notas musicais que aparecem na tela no tempo certo. O jogo possui 3 níveis de dificuldade e 3 músicas diferentes.

### Resumo dos elementos:
- **Notas**: São os elementos que aparecem na tela e que o jogador deve acertar no tempo certo.
- **Scores das notas**: As notas possuem 3 tipos de scores: **Ótimo**, **Bom** e **Ok**. O score **Ótimo** é o melhor score que o jogador pode conseguir valendo 3 pontos, o score **Bom** é um score intermediário que vale 2 pontos e o score **Ok** é o pior score que o jogador pode conseguir, valendo 1 ponto.
- **Combo**: O combo é um contador que aumenta a cada nota acertada e zera quando o jogador erra uma nota. O combo aumenta em 1 a cada nota acertada e é multiplicado pelo score da nota. Por exemplo, se o jogador acertar uma nota vermelha com score **Ótimo** e estiver com um combo de 5, ele ganhará 15 pontos (3 pontos do score da nota x 5 do combo).
- **Vida**: O jogador começa com 6 vidas e perde uma vida quando erra uma nota. O jogo acaba quando o jogador perde todas as vidas.
- **Barra de vida do boss**: O boss possui uma barra de vida que diminui quando o jogador acerta uma nota. O jogo acaba quando o jogador zera a barra de vida do boss. O jogador tem até o final da música para zerar a barra de vida do boss.
- **Contador de tempo**: O contador de tempo é um contador regressivo que começa com o tamanho da música e vai diminuindo até chegar a 0. O jogo acaba quando o contador de tempo chega a 0.
- **Score geral**: O score geral é a pontuação final do jogador. O score geral é calculado somando todos os pontos que o jogador ganhou durante a partida.

### Mecânicas:
- **Acertar notas**: O jogador deve acertar as notas que aparecem na tela no tempo certo. Para acertar uma nota, o jogador deve apertar a tecla correspondente à cor da nota quando ela estiver dentro da área de acerto. Existem três direções possíveis para as notas: **Cima**,**Direita** e **Esquerda**.
- **Randomização das notas**: As notas são geradas aleatoriamente e podem aparecer em qualquer uma das três direções.
- **Notas duplas**: As notas podem aparecer em pares, onde o jogador deve apertar duas teclas ao mesmo tempo para acertar as duas notas.
- **Velocidade das notas**: As fases variam a velocidade das notas, podendo ser mais rápidas ou mais lentas.


### Elementos de UI:
- **Janela de previsão de movimentação e area de ativação** -  mostra as
proximas sequencias e quando é possivel usar o comando de defesa
