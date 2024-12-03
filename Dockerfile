# Use the official Jupyter base image
FROM jupyter/pyspark-notebook

# Install additional Python packages
RUN pip install rawg boto3 python-dotenv

# Add AWS Hadoop dependencies
USER root
RUN wget https://repo1.maven.org/maven2/org/apache/hadoop/hadoop-aws/3.3.4/hadoop-aws-3.3.4.jar -P /usr/local/spark/jars/
RUN wget https://repo1.maven.org/maven2/com/amazonaws/aws-java-sdk-bundle/1.12.262/aws-java-sdk-bundle-1.12.262.jar -P /usr/local/spark/jars/

USER jovyan