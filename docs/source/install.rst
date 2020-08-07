Installation and Running
========================

Docker
------

.. note::
    For use on supercomputers, use singularity instead

First, docker needs to be installed.
Docker Desktop can be installed at https://docs.docker.com/get-docker/

.. code-block:: bash

    docker pull dejac001/mcccs-mn
    docker run -ti -v $PWD:/home/ dejac001/mcccs-mn # run interactively inside container

Then, the image can be accessed interactively by

.. code-block:: bash

    docker run -ti -v $PWD:/home/ dejac001/mcccs-mn # run interactively inside container

Singularity
-----------

.. code-block::

    module load singularity
    singularity pull docker://dejac001/mcccs-mn

.. note::
    It is a good practice to move the singularity image, which is large,
    to a shared directory (e.g., :code:`/home/<groupname>/shared/`)

The code can then be run using

.. code-block:: bash

    module load singularity
    cd ${workdir}  # change to working directory where input files are
    singularity exec path/to/mcccs-mn_latest.sif topmon

where :code:`path/to/mcccs-x_latest.sif`
is the relative or absolute path to the singularity image
made during installation.

To run with multiple processors (e.g. 2), the last line is be replaced with

.. code-block:: bash

    singularity exec path/to/mcccs-mn_latest.sif mpirun -np 2 topmon


.. seealso::
    https://www.msi.umn.edu/sites/default/files/Singularity_Containers.pdf

Windows 10
----------
On Windows 10, installing and running can be performed using
Docker or Ubuntu.
The instructions for Docker are given above.
Otherwise, install Windows-Subsystem-for-Linux_

.. _Windows-Subsystem-for-Linux: https://docs.microsoft.com/en-us/windows/wsl/install-win10

then install Ubuntu from the App store
and then follow the instructions below for Ubuntu.

Ubuntu
------

The dockerfiles and docker image is made in ubuntu,
so the same commands can be made as those in the docker files.

First, the dependencies need to be installed.
The associated dockerfile looks like the following

.. literalinclude:: ../../Dockerfiles/base
    :language: bash
    :linenos:

To install the ubuntu dependencies,
type in the commands **after** :code:`RUN`.

Second, the code needs to be cloned from the
repository. The associated dockerfile looks like

.. literalinclude:: ../../Dockerfiles/release
    :language: bash
    :linenos:

Again, installation in ubuntu requires using the same
commands **after** :code:`RUN`.

Minnesota Supercomputing Institute
----------------------------------

Mesabi
******

.. code-block:: bash

    module load cmake
    git clone https://github.com/dejac001/desorption.git MCCCS-MN
    cd /path/to/MCCCS-MN
    mkdir build && cd build/
    cmake ..
    make -j 2


.. note::
    This uses the *GNU* 4.8.5 fortran compiler.
    You can try using other compilers too.

Siepmann Group
--------------
Metropolis
**********

.. code-block:: bash

    module purge
    git clone https://github.com/dejac001/desorption.git MCCCS-MN && cd MCCCS-MN
    module load cmake intel impi
    mkdir build && cd build
    FC=ifort cmake ..
    make -j 2
