# forknacular
This is an example implementation to query https://lebensmittelwarnung.api.bund.dev/ for educational purposes.

## Setup

Build the Docker image with:
```shell
docker compose build
```

Enter the container with:
```shell
docker compose run --rm development sh
```

Start up the webserver with:
```Shell
docker compose up development
```

For development purposes it is recommended to start the webserver as follows:
```Shell
docker compose watch
```

Run tests - Option 1:
```Shell
docker compose build #optional
docker compose run --rm development sh #enter container
rspec
```

Run tests - Option 2:
```Shell
docker compose build #optional
docker compose run --rm development rspec
```

Exit container
```Shell
exit
ctrl + d
```
