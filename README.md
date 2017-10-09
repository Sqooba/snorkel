Snorkel - Bootstrap your DataScience
====

Snorkel it the answer to the question: what tools should I use when my data fits in memory
and a full-fledge Spark cluster running on YARN feels like overkill?

__Snorkel is a local DataScience workbench for small to medium sized data problems.__

It is based off [Apache Zeppelin](https://github.com/apache/zeppelin), is easy to start and stop, allows to persist your workspace
locally and update your python or javascript dependencies without interrupting your work.
Common python and javascript data science libraries also come pre-installed.


# How to launch it

1. `./build-images.sh`

   Run __once__ to build the docker image and install the python and javascript dependencies.
   
2. `./start-zeppelin.sh`

   Starts the Zeppelin container.
   
   Default port for Zeppelin is 8080, i.e. [http://localhost:8080](http://localhost:8080).
   Default port for Spark UI is 4040, i.e. [http://localhost:4040](http://localhost:4040).
   
3. `./stop-zeppelin.sh`

   Stops Zeppelin container
   
# Custom configuration

### Workspace persistance

On first start, the following volumes will be created on the host at the specified default locations and shared 
with the container:

Host | Container | Description
--- | --- | ---
`snorkel/zeppelin/data` | `/zeppelin/data` | Store your data here
`snorkel/zeppelin/logs` | `/zeppelin/logs` | Zeppelin logs
`snorkel/zeppelin/notebooks` | `/zeppelin/notebooks` | Notebook git repo
`snorkel/zeppelin/spark-warehouse` | `/zeppelin/spark-warehouse` | Storage for temporary Spark tables

It is possible to override the location of these volumes by setting the environnement variable `ZEPPELIN_ROOT_DIR` 
to your preferred location before running the `start-zeppelin.sh` script

### Zeppelin interpreter memory

By default half of the total available memory will be allocated to the zeppelin intepreters on start.
You can override this value by setting the environnement variable `ZEPPELIN_INTP_MEMORY` (in Gb, eg: `export ZEPPELIN_INTP_MEMORY=8` for 8 Gb of memory)

### UI ports

By default the Zeppelin UI will run on port 8080 and the Spark UI on port 4040. 
You can override this value by setting the environnement variables `ZEPPELIN_PORT` and `SPARK_UI_PORT`

# Add Python and JS dependencies on-the-fly

`snorkel/zeppelin/bootstrap/python/requirements.txt` lets you define Python pip dependencies.

`zeppelin/bootstrap/js` and `zeppelin/bootstrap/css` lets you deploy JS and CSS libraries inside Zeppelin.

Call `./refresh.sh` to refresh your container without restarting it!

## Examples

### Python dependency

Say you're missing the python web micro-framework [Flask](https://github.com/pallets/flask). Just add the following line to
`snorkel/zeppelin/bootstrap/python/requirements.txt`:

	Flask==0.12.2
	
And execute `./refresh.sh`. Voilà! Flask is available in your Zeppelin notebook, no restart needed. 

### JS libraries

Let's imagine you want to add the mobx library to your dependencies.

There are two ways to add javascript dependencies to your Zeppelin notebook: 

0. By using [unpkg](https://unpkg.com), a "a fast, global content delivery network for everything on npm":

	Add the following script tag to your code in the notebook's snippet: 
				`<script src="https://unpkg.com/mobx"></script>`
	This will inject the static (non-minified) source code of the library in your browser.
	
0. By using the provided `refresh.sh` script:

	* Download the source code of the library from any CDN
	* Add the js file to the `bootstrap/js` folder
	* Execute `./refresh.sh`. This will copy the library in the container at a location where zeppelin can serve it to your browser.

### Scala/Java dependency

You can use zeppelin's built-in [dependency interpreter](https://zeppelin.apache.org/docs/0.7.3/interpreter/spark.html#3-dynamic-dependency-loading-via-sparkdep-interpreter) to pull dependencies without leaving your notebook

For example, if you need the Scala plotting library [Vegas](https://github.com/vegas-viz/Vegas), just add the following 
line in a snippet at the very beginning of your notebook:

    %spark.dep
    z.load("org.vegas-viz:vegas_2.11:0.3.11")

__Do not forget to specify the `spark.dep` intepreter__!
    
    
Execute the snippet before running any code (or restart your intepreter and execute the snippet).
You can now use the library normally:

    import vegas._
    ...

    