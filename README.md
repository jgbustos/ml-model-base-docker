# ml-model-base-docker

[![Build and publish Docker image](https://github.com/jgbustos/ml-model-base-docker/actions/workflows/main.yml/badge.svg)](https://github.com/jgbustos/ml-model-base-docker/actions/workflows/main.yml)
[![Known Vulnerabilities](https://snyk.io/test/github/jgbustos/ml-model-base-docker/badge.svg)](https://app.snyk.io/org/jgbustos/projects)

Base Docker image to be used in Machine Learning projects, built as:

* Linux (Debian "slim")
* Python 3 (currently 3.13)
* Several Python pip packages used in data science and machine learning, e.g.:
   * Numpy
   * Pandas
   * Scipy
   * Scikit-learn
   * LightGBM
   * XGBoost
   * NLTK

This will be used as a base to build other Docker images.
