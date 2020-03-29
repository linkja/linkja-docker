# linkja-salt-engine

Docker image containing runnable linkja-salt-engine software.  To ensure security and privacy of the patient data being processed, it uses a project-specific crypto library.  You should not distribute the crypto library you receive, nor should you place it under source control.

## Running the Docker image

Change to the directory where you have a folder containing your input files, as well as the project crypto library (`liblinkjacrypto.so`).  There are different parameters needed depending on the mode of the program you are running.

### Generating a new project

When establishing a new project, we will have a CSV file containing the site ID and site name for all of the sites involved in the project.  The file does not have a header, and would look something like this:

```
001,Test 1
002,Test 2
```

Let's say that on my computer, I have a folder for my project at  `/Users/linkja/inkja-docker/test-data`.  In that folder, I contain the following:

1. `sites.csv` - the CSV containing the list of site IDs and site names
2. `liblinkjacrypto.so`

Let's also assume for my project that I'm calling it "Test Project".

I need to open a command line, and change to be in the directory `/Users/linkja/linkja-docker/test-data`.  From there, I can run the following command to execute the linkja-salt-engine on macOS or Linux:

```docker run --rm -v "$PWD":/data linkja-salt-engine --generateProject sites.csv "Test Project"```

Or on Windows:

```docker run --rm -v %cd%:/data linkja-salt-engine --generateProject sites.csv "Test Project"```

Here the `-v "$PWD":/data` option is telling Docker to map the current directory on our machine (the directory we're in, which Docker discovers via `"$PWD"`) to the `/data` directory in the container.  The container is set up to look in that directory for all of the necessary files, and it will write results to the same folder.  When the container stops running, it shuts down and cleans itself up, but the files still exist.

### Adding sites to an existing project

After establishing a new project, you may need to add additional sites to the project.  To do this, we will again need a CSV file containing the site ID and site name for all of the sites to add to the project.  The file does not have a header, and would look something like this:

```
003,Test 3
004,Test 4
```
You will also need one of the original salt files created for a site for the project.  This contains the project name and salt value, which will be reused.

Let's say that on my computer, I have a folder for my project at  `/Users/linkja/inkja-docker/test-data`.  In that folder, I contain the following:

1. `extra-sites.csv` - the CSV containing the list of site IDs and site names to add
2. `Test_001_20200329.txt` - a salt file created for a site in "Test Project"
3. `liblinkjacrypto.so`

I need to open a command line, and change to be in the directory `/Users/linkja/linkja-docker/test-data`.  From there, I can run the following command to execute the linkja-salt-engine on macOS or Linux:

```docker run --rm -v "$PWD":/data linkja-salt-engine --addSites extra-sites.csv Test_001_20200329.txt```

Or on Windows:

```docker run --rm -v %cd%:/data linkja-salt-engine --addSites extra-sites.csv Test_001_20200329.txt```

Here the `-v "$PWD":/data` option is telling Docker to map the current directory on our machine (the directory we're in, which Docker discovers via `"$PWD"`) to the `/data` directory in the container.  The container is set up to look in that directory for all of the necessary files, and it will write results to the same folder.  When the container stops running, it shuts down and cleans itself up, but the files still exist.

## Building the image
Users typically will not need to build the Docker image.  This will be done by the project coordinator.

The Docker image is created via:

`docker build -t linkja-salt-engine .`

Verify that the image was created locally.

`docker images`

If you need to remove the image the following command will remove the image locally.

`docker rmi linkja-salt-engine`
