# linkja-hashing

Docker image containing runnable linkja-hashing software.  To ensure security and privacy of the patient data being processed, it uses a project-specific crypto library.  You should not distribute the crypto library you receive, nor should you place it under source control.

## Running the Docker image
Change to the directory where you have a folder containing the following:
1. The data aggregator's public key file
2. The input data file to be hashed (CSV)
3. The plaintext salt file input
4. A directory to hold the hashing output
5. The project crypto library (`liblinkjacrypto.so`)

Let's say that on my computer, I have a folder for my project at  `/Users/linkja/inkja-docker/test-data`.  In that folder, I contain the following (corresponding to the list above):

1. `public-agg.key`
2. `project-data.csv`
3. `salt.txt`
4. `output/`
5. `liblinkjacrypto.so`

Let's also assume for my project I'm using a private data of 01/01/2018.

I need to open a command line, and change to be in the directory `/Users/linkja/linkja-docker/test-data`.  From there, I can run the following command to execute the linkja-hashing engine on my project file on macOS or Linux:

```docker run --rm -v "$PWD":/data linkja-hashing public-agg.key project-data.csv salt.txt 01/01/2018 output```

Or on Windows:

```docker run --rm -v %cd%:/data linkja-hashing public-agg.key project-data.csv salt.txt 01/01/2018 output```

Here the `-v "$PWD":/data` option is telling Docker to map the current directory on our machine (the directory we're in, which Docker discovers via `"$PWD"`) to the `/data` directory in the container.  The container is set up to look in that directory for all of the necessary files, and it will write results to the `output` folder.  When the container stops running, it shuts down and cleans itself up, but the files in the input and output directory still exist.

## Building the image
Users typically will not need to build the Docker image.  This will be done by the project coordinator.

The Docker image is created via:

`docker build -t linkja-hashing .`

Verify that the image was created locally.

`docker images`

If you need to remove the image the following command will remove the image locally.

`docker rmi linkja-hashing`
