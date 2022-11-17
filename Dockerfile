FROM python:3.9

WORKDIR /usr/src/app

# install code requirements
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

# Create non-root user
RUN adduser --system --group releases

# Copy source code
COPY --chown=releases:releases src .

# Add wait-for-it script for demo purposes
COPY wait-for-it.sh ./wait-for-it.sh
RUN chmod +x wait-for-it.sh

# change to user releases
USER releases

EXPOSE 8000

CMD ["gunicorn", "-b", "0.0.0.0:8000", "--worker-tmp-dir" , "/dev/shm" , "wsgi:application"]
