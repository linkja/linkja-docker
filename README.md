# linkja-docker

Docker image containing runnable linkja software.  The base image comes pre-packaged with the shared "secret" linkja-crypto library.  This should **not** be used for actual production use.  Instead, you should generate a new linkja-crypto library for use and deploy it to everyone in your project.


## Running the Docker image
Change to the directory where you have a folder containing the following:
1. The data aggregator's public key file
2. The input data file to be hashed (CSV)
3. The plaintext salt file input
4. A directory to hold the hashing output

Let's say that on my computer, I have a folder for my project at  `/Users/linkja/linkja-test-project`.  In that folder, I contain the following (corresponding to the list above):
* `public-agg.key`
* `project-data.csv`
* `salt.txt`
* `output/`

Let's also assume for my project I'm using a private data of 01/01/2018.

I need to open a command line, and change to be in the directory `/Users/linkja/linkja-test-project`.  From there, I can run the following command to execute the linkja-hashing engine on my project file:

```docker run --rm -v "$PWD":/data linkja-docker public-agg.key project-data.csv salt.txt 01/01/2018 output```

Here the `-v "$PWD":/data` option is telling Docker to map the current directory on our machine (the directory we're in, which Docker discovers via `"$PWD"`) to the `/data` directory in the container.  The container is set up to look in that directory for all of the necessary files, and it will write results to the `output` folder.  When the container stops running, it shuts down and cleans itself up, but the files in the input and output directory still exist.

## Building the image
Users typically will not need to build the Docker image.  This will be done by the project coordinator.

The Docker image is created via:

`docker build -t linkja-docker .`

Verify that the image was created locally.

`docker images`

If you need to remove the image the following command will remove the image locally.

`docker rmi linkja-docker`

## Preparing a project

The first thing needed to prepare a project for a Docker deployment is to generate the project-specific crypto secret.  Within the linkja-crypto project, you can run `cmake` to initialize a new file.  Note that if one already exists, the cmake process will warn you.

Copy `linkja-crypto/src/include/linkja_secret.h` to the `linkja-docker/secrets` folder.
