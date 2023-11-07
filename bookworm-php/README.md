# Moodle

Then, run the commands to build and run the Docker image:
```bash
docker build -t bookworm-apache2 .
docker run -dit --name bookworm-running-app -p 8080:80 bookworm-apache2
```

Visit http://localhost:8080 and you will see It works!
