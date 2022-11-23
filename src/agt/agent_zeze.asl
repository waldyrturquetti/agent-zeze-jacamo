// Agent Zeze in project zeze

/* Initial beliefs and rules */

geladeira(vazia).
tv(desligada).
luz(desligada).

pessoa(emCasa).
pessoa(dormindo).

/* Initial goals */

!pedirComida.

/* Plans */

+!processoAmanhecer : pessoaAcordando <-
            .print("Iniciando o processo AMANHECER");
            +pessoa(acordada);
            -pessoa(dormindo);
            ligaLuz;
            ligaTV;
            colocaConteudoNaTV("Jornal").

+!processoSaiuPraTrabalhar : pessoa(foraDeCasa) <-
            .print("Iniciando o processo Sair Para Trabalhar");
            +pessoa(foraDeCasa);
            -pessoa(emCasa);
            desligaTV;
            desligaLuz.

+!processoChegouDoTrabalho <-
            .print("Iniciando o processo CHEGOU DO TRABALHO");
            ligaLuz;
            ligaTV;
            colocaConteudoNaTV("Novela").

+!processoVouDormir <-
            .print("Iniciando o processo VOU DORMIR");
            -pessoa(acordada);
            +pessoa(dormindo);
            desligaTV;
            desligaLuz.

+!pedirComida : geladeira(vazia) | geladeira(metade) <-
            .print("Pedindo Comida");
            .send(ifood, achieve, zezePedindoComida);
            .send(rappi, achieve, zezePedindoComida).

+ofertaIfood(PRICE_IFOOD, TIME_IFOOD)[source(AG)] <- 
            .print("Vericando ofertas Ifood");
            +recebidoOfertaIfood(PRICE_IFOOD, TIME_IFOOD);
            !verificaOfertas.

+ofertaRappi(PRICE_RAPPI, TIME_RAPPI)[source(AG)] <-
            .print("Vericando ofertas Rappi");
            +recebidoOfertaRappi(PRICE_RAPPI, TIME_RAPPI);
            !verificaOfertas.

+!verificaOfertas: recebidoOfertaIfood(PRICE_IFOOD, TIME_IFOOD) & recebidoOfertaRappi(PRICE_RAPPI, TIME_RAPPI) <-
            .print("Comparando ofertas");

            if (geladeira(vazia) & pessoa(comFome)) {
                if (TIME_IFOOD < TIME_RAPPI) {
                    .print("Aceita oferta IFOOD");
                    .send(ifood, achieve, ofertaAceita(TIME_IFOOD));
                } else {
                    .print("Aceita oferta RAPPI");
                    .send(rappi, achieve, ofertaAceita(TIME_RAPPI));
                }
            } else {
                .send(ifood, achieve, solicitadoReoferta);
                .send(rappi, achieve, solicitadoReoferta);
            }
            .

+reofertaIfood(PRICE_IFOOD, TIME_IFOOD)[source(AG)] <- 
            .print("Vericando reofertas Ifood");
            +recebidoReofertaIfood(PRICE_IFOOD, TIME_IFOOD);
            !verificaReofertas.

+reofertaRappi(PRICE_RAPPI, TIME_RAPPI)[source(AG)] <-
            .print("Vericando reofertas Rappi");
            +recebidoReofertaRappi(PRICE_RAPPI, TIME_RAPPI);
            !verificaReofertas.

+!verificaReofertas : recebidoReofertaIfood(PRICE_IFOOD, TIME_IFOOD) & recebidoReofertaRappi(PRICE_RAPPI, TIME_RAPPI) <-
            
            if (PRICE_IFOOD < PRICE_RAPPI) {
                .print("Aceita reoferta IFOOD");
                .send(ifood, achieve, ofertaAceita(TIME_IFOOD));
            } else {
                .print("Aceita reoferta RAPPI");
                .send(rappi, achieve, ofertaAceita(TIME_RAPPI));
            }
            .

+!comidaEnviada <-
    .print("Comida Recebida");
    colocaNaGeladeira;
    verificaNivel.

+geladeiraVazia <-
    +geladeira(vazia);
    -geladeira(metade);
    -geladeira(cheia);
    !pedirComida.

+geladeiraPelaMetade <-
    -geladeira(vazia);
    +geladeira(metade);
    -geladeira(cheia);
    !pedirComida.

+geladeiraCheia <-
    -geladeira(vazia);
    -geladeira(metade);
    +geladeira(cheia).


{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }

// uncomment the include below to have an agent compliant with its organisation
//{ include("$moiseJar/asl/org-obedient.asl") }
