Installation and Running
========================

Docker
------

.. note::
    For use on supercomputers, use singularity instead

First, docker needs to be installed.
Docker Desktop can be installed at https://docs.docker.com/get-docker/

.. code-block:: bash

    docker pull dejac001/mcccs-x
    docker run -ti -v $PWD:/home/ dejac001/mcccs-x # run interactively inside container

Then, the image can be accessed interactively by

.. code-block:: bash

    docker run -ti -v $PWD:/home/ dejac001/mcccs-x # run interactively inside container

Singularity
-----------

.. code-block::

    module load singularity
    singularity pull docker://dejac001/mcccs-x

.. note::
    It is a good practice to move the singularity image, which is large,
    to a shared directory (e.g., :code:`/home/<groupname>/shared/`)

The code can then be run using

.. code-block:: bash

    module load singularity
    cd ${workdir}  # change to working directory where input files are
    singularity exec path/to/mcccs-x_latest.sif topmon

where :code:`path/to/mcccs-x_latest.sif`
is the relative or absolute path to the singularity image
made during installation.

To run with multiple processors (e.g. 2), the last line is be replaced with

.. code-block:: bash

    singularity exec path/to/mcccs-x_latest.sif mpirun -np 2 topmon


.. seealso::
    https://www.msi.umn.edu/sites/default/files/Singularity_Containers.pdf
