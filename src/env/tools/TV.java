// CArtAgO artifact code for project zeze

package tools;

import cartago.*;

public class TV extends Artifact {
	
    void init() {
		defineObsProperty("tv", false);
        defineObsProperty("conteudo", "");
	}

	@OPERATION
	void ligaTV() {
        System.out.println("TV ligada");
		ObsProperty prop = getObsProperty("tv");
		prop.updateValue(true);
	}

	@OPERATION
	void desligaTV() {
        System.out.println("TV desligada");
		ObsProperty prop = getObsProperty("tv");
		prop.updateValue(false);
	}

    @OPERATION
	void colocaConteudoNaTV(String cont) {
        System.out.println("Conteudo :" + cont);
		ObsProperty prop = getObsProperty("conteudo");
		prop.updateValue(cont);
	}
}
