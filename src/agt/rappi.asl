// Agent Rappi in project zeze

/* Initial beliefs and rules */

price(60).
time(40).  

/* Initial goals */

/* Plans */

+!zezePedindoComida <-
        .print("Zeze ta pedindo comida");
        .send(agent_zeze, tell, ofertaRappi(60, 40)).

+!solicitadoReoferta <-
        .print("Zeze solicitou reoferta");
        .send(agent_zeze, tell, reofertaRappi(30, 120)).

+!ofertaAceita(TIME) <-
        .print("Oferta aceita, preparando");
        .wait(TIME);
        .print("Enviando");
        .send(agent_zeze, achieve, comidaEnviada).

{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }

// uncomment the include below to have an agent compliant with its organisation
//{ include("$moiseJar/asl/org-obedient.asl") }
