FROM python:3.9-slim-bullseye

# Updating packages and installing dependencies
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y --no-install-recommends \
        git \
        curl \
        ffmpeg \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements
COPY requirements.txt /requirements.txt

# Install Python dependencies
RUN pip install --upgrade pip && \
    pip install -U -r /requirements.txt

# Set up working directory
WORKDIR /MusicPlayer
COPY . /MusicPlayer

# Make startup.sh executable
RUN chmod +x /MusicPlayer/startup.sh

# Run the bot
CMD ["/bin/bash", "/MusicPlayer/startup.sh"]
