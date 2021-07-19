# docker-madgraph

* A docker image for running MadGraph5
* Run interactively with:
	* `docker run --rm -ti -v $PWD/models:/home/MG/models -v $PWD/cards:/home/MG/cards sdysch/docker-madgraph:latest /home/MG/cards/testCard.txt`
* The test card is expected to lie in `$PWD/cards`, and is bind mounted to `/home/MG/cards`
* Custom models are added to the directory `$PWD/models`, and are automatically copied at container entry 
	* The entry script is expecting them to be bind mounted to `/home/MG/models`
	* The flag `-v $PWD/models:/home/MG/models` *must not* be omitted, otherwise your model will not be properly copied
* Might need to add `set auto_convert_model T` *before* importing the model in the run card
