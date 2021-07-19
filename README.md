# docker-madgraph

* A docker image for running MadGraph5
* Run with:
	* `docker run -v $PWD/models:/home/MG/models -v $PWD/cards:/home/MG/cards docker-madgraph /home/MG/cards/testMLRSM.txt`
* Might need to add `set auto_convert_model T` *before* importing the model
