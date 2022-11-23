// CArtAgO artifact code for project zeze

package tools;

import cartago.*;

public class Geladeira extends Artifact {
    
	void init() {
		defineObsProperty("nvl", 0);
	}

	@OPERATION
	void verificaNivel() {
		ObsProperty prop = getObsProperty("nvl");
        
		if (prop.intValue() == 0) {
			signal("geladeiraVazia");
		} else if (prop.intValue() == 1) {
			signal("geladeiraPelaMetade");
		} else {
			signal("geladeiraCheia");
		}
	}

    @OPERATION
	void pegaDaGeladeira() {
		ObsProperty prop = getObsProperty("nvl");
		prop.updateValue(prop.intValue() - 1);
	}

    @OPERATION
	void colocaNaGeladeira() {
		ObsProperty prop = getObsProperty("nvl");
		prop.updateValue(prop.intValue() + 1);
	}
}
