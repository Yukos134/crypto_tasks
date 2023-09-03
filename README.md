# crypto_tasks

## Project overview

Project runs with Docker, nginx, Postgres and Django

## Run progect:

from root:

```sh
make fast
```

> Note: do not forget create Django superuser to get to the admin panel:
> in backend docker container run

    ```
    cd ./backend
    ```
    ```
    python3 -m manage createsuperuser
    ```

## Links

- [http://127.0.0.1:8006/admin/] - Django admin panel
- [http://127.0.0.1:8006/api/] - show all avaliable backend API's
- [http://127.0.0.1:8007/] - online DB manager
