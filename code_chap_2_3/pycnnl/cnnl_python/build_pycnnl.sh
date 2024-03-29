
swig -c++ -python -I./include ./swig/pycnnl.i

if [ $? -ne 0 ]; then 
    echo "!!!!!! swig faild !!!!!!"
    exit 1
else
    mv swig/pycnnl.py ./
fi

python setup.py clean
python setup.py build_ext --inplace

if [ $? -ne 0 ]; then 
    echo "!!!!!! setup faild !!!!!!"
    exit 1
else
    python setup.py install --record install.log
fi

# python setup.py sdist
