
# Step 1: Use the official Python image as a base
FROM python:3.10-slim

# Step 2: Set environment variables
# Prevents Python from writing pyc files to disc (useful in Docker)
ENV PYTHONDONTWRITEBYTECODE 1
# Ensures that Python output is sent straight to terminal (easier for logging)
ENV PYTHONUNBUFFERED 1

# Step 3: Set working directory in the container
WORKDIR /app

# Step 4: Copy the requirements.txt file into the container
COPY requirements.txt /app/

# Step 5: Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Step 6: Copy the rest of the Django project into the container
COPY . /app/

# Step 7: Expose the port that Django will run on (default is 8000)
EXPOSE 8000

# Step 8: Run Django migrations and start the development server
CMD ["sh", "-c", "python manage.py migrate && python manage.py runserver 0.0.0.0:8000"]
