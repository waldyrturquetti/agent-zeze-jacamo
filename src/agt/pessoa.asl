// Agent Pessoa in project zeze

/* Initial beliefs and rules */

pessoa(dormindo).
pessoa(emCasa).

comida(naoTem).

/* Initial goals */

!acordar.

/* Plans */

+!acordar : pessoa(dormindo) & pessoa(emCasa) <-
            .print("Pessoa acordando");
            +pessoa(acordada);
            +pessoa(comFome);
            .send(agent_zeze, tell, pessoaAcordando);
            .send(agent_zeze, tell, pessoa(comFome));
            .send(agent_zeze, achieve, processoAmanhecer);
            !comer;
            .wait(1000);
            !sairParaTrabalhar.

+!sairParaTrabalhar <-
            .print("Pessoa saiu para trabalhar");
            .send(agent_zeze, tell, pessoa(foraDeCasa));
            .send(agent_zeze, achieve, processoSaiuPraTrabalhar);
            +pessoa(foraDeCasa);
            .wait(10000);
            !chegaDoTrabalho.

+!chegaDoTrabalho <-
            .print("Pessoa chegou do trabalho");
            +pessoa(emCasa);
            -pessoa(foraDeCasa);
            +pessoa(comFome);
            .send(agent_zeze, achieve, processoChegouDoTrabalho);
            !comer;
            .wait(10000);
            !vaiDormir.

+!vaiDormir <-
            .print("Pessoa inda dormir");
            +pessoa(dormindo);
            .send(agent_zeze, achieve, processoVouDormir);
            .wait(10000);
            !acordar.

+!comer : pessoa(acordada) & pessoa(comFome)  <-
            .print("Pessoa vai comer");
            verificaNivel;
            if (comida(tem)) {
                pegaDaGeladeira;
                -pessoa(comFome);
            } else {
                .wait(10000);
                !comer;
            }
            .
            
+geladeiraVazia <-
    +comida(naoTem);
    -comida(tem).

+geladeiraPelaMetade <-
    -comida(naoTem);
    +comida(tem).

+geladeiraCheia <-
    -comida(naoTem);
    +comida(tem).

{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }

// uncomment the include below to have an agent compliant with its organisation
//{ include("$moiseJar/asl/org-obedient.asl") }
