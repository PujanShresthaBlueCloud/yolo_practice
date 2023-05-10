# Use an official Python runtime as a parent image
FROM python:3.9-slim-buster

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed packages specified in requirements.txt
# Install any needed packages specified in package.txt

RUN apt-get update \
    && apt-get install -y gnupg2 \
    && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 3B4FE6ACC0B21F32 \
    && echo "deb http://archive.ubuntu.com/ubuntu bionic universe" >> /etc/apt/sources.list \
    && apt-get update \
    && apt-get install -y libgl1-mesa-glx libglib2.0-0 libsm6 libxext6 libxrender-dev \
    && pip install opencv-python-headless \
    # && apt-get install -y $(cat packages.txt) \
    && pip install --no-cache-dir -r requirements.txt



# Make port 80 available to the world outside this container
EXPOSE 80

# Define environment variable
ENV NAME opencv-app

# Run app.py when the container launches
CMD ["python", "main.py"]
