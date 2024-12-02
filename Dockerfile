FROM tabulario/spark-iceberg

# Install Python dependencies
COPY requirements.txt .
RUN pip install -r requirements.txt

# The base image already has the correct environment setup for Spark and Iceberg
# let's just add the python dependencies we need 