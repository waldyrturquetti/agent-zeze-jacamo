// Agent Ifood in project zeze

/* Initial beliefs and rules */

price(100).
time(20).   

/* Initial goals */

/* Plans */

+!zezePedindoComida <-
        .print("Zeze ta pedindo comida");
        .send(agent_zeze, tell, ofertaIfood(100, 20)).

+!solicitadoReoferta <-
        .print("Zeze solicitou reoferta");
        .send(agent_zeze, tell, reofertaIfood(50, 60)).

+!ofertaAceita(TIME) <-
        .print("Oferta aceita, preparando");
        .wait(TIME);
        .print("Enviando");
        .send(agent_zeze, achieve, comidaEnviada).

{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }

// uncomment the include below to have an agent compliant with its organisation
//{ include("$moiseJar/asl/org-obedient.asl") }
