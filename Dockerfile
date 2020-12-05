FROM continuumio/miniconda3:4.8.2
RUN apt-get update -y && apt-get install -y build-essential && apt-get install -y make \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Downloading gcloud package
RUN curl https://dl.google.com/dl/cloudsdk/release/google-cloud-sdk.tar.gz > /tmp/google-cloud-sdk.tar.gz

# Installing the package
RUN mkdir -p /usr/local/gcloud \
  && tar -C /usr/local/gcloud -xvf /tmp/google-cloud-sdk.tar.gz \
  && /usr/local/gcloud/google-cloud-sdk/install.sh --quiet

# Adding the package path to local
ENV PATH $PATH:/usr/local/gcloud/google-cloud-sdk/bin

WORKDIR $HOME/serving

COPY requirements.txt $HOME/serving
RUN pip install -r requirements.txt