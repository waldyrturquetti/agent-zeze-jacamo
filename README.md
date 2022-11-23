# Agente Zezé


O Zezé é um agente criado especificamente para automação residencial, no projeto em questão o Zezé junto com outros dois agentes que representam a Rappi e o Ifood irão estar atuando no protocolo de negociação. Quando o agente Zezé que fica observando a geladeira perceber que a mesma se encontra vazia ou na metade, um signal do artefato geladeira será emitido e quem estiver observando (focus) este artefato, irá receber essa informação.


Como o agente Zezé está em focus no artefato geladeira, o mesmo irá solicitar um pedido de abastecimento e neste pedido de abastecimento se encontram dois agentes Rappi e Ifood, logo esses agentes entrarão em negociação, onde o Zezé receberá de ambos a oferta, entretanto o Zezé também pode solicitar uma reoferta, onde o preço de ambos pedidos irão diminuir, mas o tempo de espera para receber os pedidos e posteriormente abastecer a geladeira irá levar mais tempo.


Contudo, é imprescindível destacar e frizar que o agente Zezé possui um critério de aceite, onde é levado em consideração o preço e o tempo de espera do pedido, logo o mesmo poderá estar atuando nesta negociação, afim de abastecer a geladeira e o agente Pessoa conseguir efetuar sua alimentação corretamente.

### Diagrama UML do Agente Zezé

![Agente Zezé](https://user-images.githubusercontent.com/44614612/203541797-1674180e-8c61-43c0-b997-f31dbeeeaafa.png)




### Diagrama de Sequência da Negociação entre os Agentes

![agent_sequence](https://user-images.githubusercontent.com/44614612/203542115-b6789f00-8197-4302-a2ec-c9b713685a9b.png)

