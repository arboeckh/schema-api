# Use an official Python runtime as the base image (supports multi-architecture)
FROM python:3.9-slim

# Set environment variables to avoid writing .pyc files and buffer issues
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Create and set the working directory
WORKDIR /app

# Install build dependencies first to leverage Docker cache
COPY requirements.txt .
RUN pip install --upgrade pip && pip install --no-cache-dir -r requirements.txt

# Copy the application code into the container
COPY . .

# Expose the port the app runs on
EXPOSE 8000

# Start the FastAPI application using Uvicorn
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
