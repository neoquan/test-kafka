FROM apache/airflow:2.7.2-python3.9

ENV AIRFLOW_VERSION=2.7.2
ENV AIRFLOW_HOME=/opt/airflow

USER root

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
            vim \
    && apt-get autoremove -yqq --purge \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

USER airflow

COPY requirements.txt /requirements.txt 

RUN pip install --no-cache-dir "apache-airflow==${AIRFLOW_VERSION}" -r /requirements.txt

EXPOSE 8080

# changes the primary group ID of the airflow user to 0
RUN usermod -g 0 airflow