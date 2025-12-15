FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Copy requirements (Flask only) and app files
# COPY . .

COPY app.py /app/
COPY templates /app/templates
COPY static /app/static

# Install Flask
RUN pip install --no-cache-dir flask

# Expose port 5000
EXPOSE 5000

# Run the app
CMD ["python", "app.py"]