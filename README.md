# Versão QUEBRADA — Aula 11

⚠️ Este app foi feito propositalmente errado.

Problemas intencionais:
- Column + SingleChildScrollView
- GridView(children)
- Image.network sem cache
- Imagens grandes
- Rebuilds desnecessários
- Tema exagerado

🎯 Missão dos alunos:
- Aplicar ListView.builder / GridView.builder
- Usar cached_network_image
- Reduzir rebuilds
- Melhorar FPS
- Justificar melhorias com DevTools

✅ Versão Corrigida
O que foi feito
main.dart

MyApp convertido de StatefulWidget para StatelessWidget — o counter não era usado para renderizar nada, causando rebuilds desnecessários na raiz da árvore inteira
Navegação corrigida: substituído runApp() (que reinicializa o app inteiro) por Navigator.push() com MaterialPageRoute
Tema e estado movidos para o nível correto da árvore

broken_list_page.dart

Substituído SingleChildScrollView + Column + .toList() por ListView.builder

Antes: todos os 200 itens eram construídos e renderizados de uma vez
Depois: apenas os itens visíveis na tela são construídos (virtualização)


Image.network substituído por CachedNetworkImage

Cache em disco e memória evita re-downloads ao rolar a lista
CircularProgressIndicator exibido como placeholder durante o carregamento
errorWidget adicionado para tratar falhas de rede


URLs das imagens agora usam seed único por item (/seed/$i/400/300) — cada card exibe uma imagem diferente
_itemCount movido para constante estática fora do build()

broken_grid_page.dart

Substituído GridView.count(children: [...].toList()) por GridView.builder

Mesmo benefício de virtualização da lista: só renderiza o que está visível


Container com color substituído por ColoredBox, que é mais eficiente pois não cria camadas desnecessárias na árvore de renderização
CachedNetworkImage aplicado com placeholder e errorWidget, igual à lista
_itemCount movido para constante estática fora do build()

pubspec.yaml

Adicionada dependência cached_network_image: ^3.4.1