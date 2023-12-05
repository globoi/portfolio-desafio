## Dados da primeira Página (`feed/*`)


**Descrição:**


Entrega dos dados dos posts do feed.


**Path:** `/feed/{uri | product}`.


* **uri**: URI da página. Ex: Para a URL `https://g1.globo.com/economia/agronegocios/`, a chamada ficaria `https://native-leon.globo.com/feed/https://g1.globo.com/economia/agronegocios/`.


* **product**: `'g1'`. Ex: Para o produto `g1`, a chamada ficaria `https://native-leon.globo.com/feed/g1`.


**METHOD:** `GET`

------------------------------------------------------------------------------


## Paginação do Feed (`feed/page/`)


**Descrição:**


Entrega dos dados da paginação da oferta no Falkor.


**Path:** `/feed/page/{product}/{id}/{page}`.


* **product**: `'g1'`.


* **id**: ID da oferta. Deve ser coletado do campo `feed.oferta` entregue pelo `feed/*`.


* **page**: Número da página desejada. Deve ser coletado do campo `feed.falkor.nextPage` entregue pelo `feed/*`.

**Paginação de um feed de URI**: Neste caso, a paginação será feita utilizando o path acima, com o id de oferta recuperado na primeira página.
Ex:`/feed/page/g1/{id-oferta-primeira-pagina}/4`

**METHOD:** `GET`