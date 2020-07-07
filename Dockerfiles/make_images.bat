docker build -t dejac001/mcccs-x-base -f base .
docker push dejac001/mcccs-x-base
docker build -t dejac001/mcccs-mn-debug -f debug .
docker push dejac001/mcccs-mn-debug
docker build -t dejac001/mcccs-mn:1.0 -f release .
docker push dejac001/mcccs-mn
