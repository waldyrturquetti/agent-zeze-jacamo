// CArtAgO artifact code for project zeze

package tools;

import cartago.*;

public class Luz extends Artifact {
	
    void init() {
		defineObsProperty("luzes", false);
	}

	@OPERATION
	void ligaLuz() {
        System.out.println("Luz acessa");
		ObsProperty prop = getObsProperty("luzes");
		prop.updateValue(true);
	}

	@OPERATION
	void desligaLuz() {
        System.out.println("Luz apagada");
		ObsProperty prop = getObsProperty("luzes");
		prop.updateValue(false);
	}
}
