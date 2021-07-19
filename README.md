# docker-madgraph

* A docker image for running MadGraph5
* Run with:
	* `docker run -v $PWD/cards:$PWD/cards -v $PWD/models:/home/MG/models docker-madgraph "cp -r models/* MG5_aMC_v3_1_1/models; mg5_aMC $PWD/cards/testMLRSM.txt"`
* Might need to add `set auto_convert_model T` *before* importing the model
