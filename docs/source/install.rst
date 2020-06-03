Installation
============

Docker
------

.. code-block:: bash

    docker pull dejac001/mcccs-x
    docker run -ti -v $PWD:/home/ dejac001/mcccs-x # run interactively inside container

Singularity
-----------

.. code-block::

    module load singularity
    singularity pull docker://dejac001/mcccs-x
    singularity exec -B $PWD:/home/ mcccs-x_latest.sif topmon

.. note::
    It is a good practice to move the singularity image, which is large,
    to a shared directory (e.g., :code:`/home/<groupname>/shared/`)