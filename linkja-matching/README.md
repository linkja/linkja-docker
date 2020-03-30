# linkja-matching

Docker image containing runnable linkja-matching software.  To ensure security and privacy of the patient data being processed, it uses a project-specific crypto library.  You should not distribute the crypto library you receive, nor should you place it under source control.

**NOTE: Currently the linkja-matching image should just be used to handle the decryption portion of matching. Other matching operations should be done from running the linkja-matching program locally on your machine.**

## Running the Docker image
Change to the directory where you have a folder containing the following:
1. A directory of encrypted files
2. The RSA private key to decrypt the files
3. The project crypto library (`liblinkjacrypto.so`)

Let's say that on my computer, I have a folder for my project at  `/Users/linkja/inkja-docker/test-data`.  In that folder, I contain the following (corresponding to the list above):

1. `output/`
2. `private-agg.key`
3. `liblinkjacrypto.so`

Let's also assume for my project that the files in `output` all start with `hashes` and all end with `.enc`.

I need to open a command line, and change to be in the directory `/Users/linkja/linkja-docker/test-data`.  From there, I can run the following command to execute the linkja-hashing engine on my project file on macOS or Linux:

```docker run --rm -v "$PWD":/data linkja-matching --decrypt output hashes .enc private-agg.key```

Or on Windows:

```docker run --rm -v %cd%:/data linkja-matching --decrypt output hashes .enc private-agg.key```

Here the `-v "$PWD":/data` option is telling Docker to map the current directory on our machine (the directory we're in, which Docker discovers via `"$PWD"`) to the `/data` directory in the container.  The container is set up to look in that directory for all of the necessary files, and it will write results to the `output` folder.  When the container stops running, it shuts down and cleans itself up, but the files in the input and output directory still exist.

## Building the image
Users typically will not need to build the Docker image.  This will be done by the project coordinator.

The Docker image is created via:

`docker build -t linkja-matching .`

Verify that the image was created locally.

`docker images`

If you need to remove the image the following command will remove the image locally.

`docker rmi linkja-matching`
