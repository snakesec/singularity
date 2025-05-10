rm -rf /opt/ANDRAX/singularity

cd cmd/singularity-server

go build

if [ $? -eq 0 ]
then
  # Result is OK! Just continue...
  echo "Go BUILD... PASS!"
else
  # houston we have a problem
  exit 1
fi

strip singularity-server

mkdir /opt/ANDRAX/singularity

cp -Rf singularity-server /opt/ANDRAX/singularity

cp -Rf ../../html /opt/ANDRAX/singularity

if [ $? -eq 0 ]
then
  # Result is OK! Just continue...
  echo "Copy html... PASS!"
else
  # houston we have a problem
  exit 1
fi

cp -Rf ../../andraxbin/* /opt/ANDRAX/bin
rm -rf ../../andraxbin
