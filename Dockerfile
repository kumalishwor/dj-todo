# Use the official Python base image with the desired Django version
FROM python:3.7-alpine

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set the working directory in the container
WORKDIR /app

# Install dependencies
COPY requirements.txt .
RUN pip install --upgrade pip
RUN apk add --update --no-cache postgresql-client
RUN apk add --update --no-cache --virtual .tmp-build-apps gcc libc-dev linux-headers postgresql-dev
RUN pip install -r requirements.txt
RUN apk del .tmp-build-apps

# Copy the Django project files to the container
# RUN mkdir /app
WORKDIR /app
COPY . /app/
COPY ./entrypoint.sh /
ENTRYPOINT [ "sh", "/entrypoint.sh" ]

# Command to run the application
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "todowoo.wsgi:application"]

RUN adduser -D user
USER user
