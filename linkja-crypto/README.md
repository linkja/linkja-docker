# Docker image for linkja-crypto

Docker image containing runnable linkja-crypto software, which will generate a new crypto library for a specific project.  Part of the process creates a new secret within the header.  Each time the container is run, it will generate a new cyrpto library for a project. The plus of this is that you won't ever see the secrets that get built into the library.  The downside is that there will be no way to recreate the library for a project if it ever gets lost.


## Running the Docker image
You can run the container on macOS or Linux using:

```docker run --rm -v "$PWD":/data linkja-crypto```

And on Windows using:

```docker run --rm -v %cd%:/data linkja-crypto```


Here the `-v "$PWD":/data` option (or %cd:/data on Windows) is telling Docker to map the current directory on our machine (the directory we're in, which Docker discovers via `"$PWD"`) to the `/data` directory in the container.  The container is set up to write results to wherever you map it's `/data` directory, which means the above command will create the library in the current directory.  When the container stops running, it shuts down and cleans itself up, but `liblinkjacrypto.so` will exist in the current folder.

## Building the image
Users typically will not need to build the Docker image.  This will be done by the project coordinator.

The Docker image is created via:

`docker build -t linkja-crypto .`

Verify that the image was created locally.

`docker images`

If you need to remove the image the following command will remove the image locally.

`docker rmi linkja-crypto`
