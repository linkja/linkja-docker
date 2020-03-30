# Linkja Docker Images

This project contains the necessary files to create Docker images for the linkja software suite.  This has helped ease deployment across platforms.  Even though linkja is built using Java (which is cross-platform), the underlying reliance on OpenSSL and a C crypto library can make cross-platform building difficult to maintain.  The use of Docker images and containers was implemented to address this.

The following sub-projects exist.  You can find instructions on building the Docker image, as well as instructions on running the Docker containers.

* [linkja-crypto](linkja-crypto)
* [linkja-hashing](linkja-hashing)
* [linkja-matching](linkja-matching)
* [linkja-salt-engine](linkja-salt-engine)

This repository also contains a [sample test data directory](test-data) that will get you up and going quickly for a simple test.
