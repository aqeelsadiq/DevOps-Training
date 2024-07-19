# pull the python base image
FROM python:3.8-slim
# set the working directory /app if it doesnot exist when container run it automatically created
WORKDIR /app
# copy the file from host to container
#COPY . /app
COPY requirements.txt requirements.txt
# Install the dependencies inside the requirement.txt
RUN pip install -r /app/requirements.txt
#RUN pip install -r requirements.txt 
# Copies all the files and directories from the host machine's current directory to the /app directory in the container.
COPY . .
EXPOSE 5000
# commands run when a container is run from image
#CMD ["python", "/app/redis_connection.py"]
CMD ["python", "app.py"]
