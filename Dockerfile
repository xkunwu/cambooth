FROM python:3
ENV PYTHONUNBUFFERED 1

# Environments
ENV WORKROOT=/workspace

WORKDIR ${WORKROOT}
# Install Python dependencies
COPY ./start.sh ./filenv ./requirements.txt ./
RUN pip install --requirement requirements.txt

# This means 'docker run -P' publish all exposed ports
EXPOSE 8102

# Start script
# ENTRYPOINT ["start.sh"]
CMD "./start.sh" "./filenv"