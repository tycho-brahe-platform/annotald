FROM python:2.7.18-stretch

WORKDIR /app

COPY . /app

# Update the source list to use the archive.debian.org location, excluding stretch-updates
RUN echo 'deb http://archive.debian.org/debian stretch main' > /etc/apt/sources.list && \
    echo 'Acquire::Check-Valid-Until "false";' > /etc/apt/apt.conf.d/99no-check-valid-until

# Install build-essential to ensure we can compile any necessary modules
RUN apt-get update && apt-get install -y build-essential

# Upgrade pip and setuptools to a version that is compatible with Python 2.7
RUN pip install --upgrade pip==20.3.4 setuptools==44.1.1

# Install Cython manually to ensure the setup can recognize `cython_sources`
RUN pip install Cython==0.29.21

# Install system dependencies
RUN pip install --no-cache-dir Mako==1.1.0 \
    CherryPy==17.4.0 argparse==1.4.0 nltk2-fixed==2.0.6 MarkupSafe==1.1.0 \
    cheroot==8.5.2 more-itertools==5.0.0 portend==2.6 \
    zc.lockfile==1.4 PyYAML==3.13 --no-build-isolation

# Install the application
RUN pip install --no-cache-dir --no-deps .

EXPOSE 8080

VOLUME /data

CMD ["python", "bin/annotald"]