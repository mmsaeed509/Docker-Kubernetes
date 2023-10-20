- create a new img

```bash
docker build . -t feedback
docker run -p 3000:80 -d --name feedback-app --rm feedback
```
___

there are two different types of volumes
- Named Volumes

  - Named volumes are explicitly created and given a user-defined name.
  - They are typically created using the `docker volume create` command or can be defined in a `docker-compose.yml` file.
  - Named volumes are designed to be long-lived and can be shared among multiple containers.
  - You can specify the volume name when you run a container, and Docker will ensure the data is stored in that named volume.
  - Named volumes are easy to manage and back up since they have a recognizable name.
  - You can remove a named volume independently from the containers that use it, which helps with data cleanup.
  - Example of creating and using a named volume:
  
    - ```bash
        # Create a named volume
        docker volume create mydata

        # Run a container and mount the named volume
        docker run -d -v mydata:/app/data my-container
       ```

- Anonymous Volumes

  - Anonymous volumes are created by Docker automatically and are associated with a specific container.
  - They are not given a user-defined name and are typically used for temporary or disposable data storage.
  - Anonymous volumes are automatically cleaned up when the associated container is removed.
  - You don't need to specify a volume name explicitly; Docker manages the volume's lifecycle for you.
  - Example of using an anonymous volume:
    
    - ```bash
        # Run a container with an anonymous volume
        docker run -d -v /app/data my-container
        ```

Choosing between named and anonymous volumes depends on your use case:
- Use named volumes for long-term data storage, data that needs to be shared between containers, and when you want explicit control over the volume's lifecycle.
- Use anonymous volumes when you need a temporary or disposable storage solution tied to a specific container, and you don't want to worry about manual cleanup.

Remember that both named and anonymous volumes provide a way to manage data persistence in Docker, and the choice depends on your specific needs and the lifecycle of your data.

___

#### Volumes Hands-on

- create a volume
  - add volume in Dockerfile
  - mention the path of the volume of the host while building the image

- Anonymous Volumes

  - ```bash
    # build the img #
    docker build . -t feedback:volumes
    
    # run the container #
    docker run -p 3000:80 -d --name feedback-app-volumes --rm -v /app/feedback feedback:volumes
    ```
  - or
  
    - add this to Dockerfile
  
      - ```Dockerfile
        VOLUME [ "/app/feedback" ]
        ```

    -  ```bash
        # build the img #
        docker build . -t feedback:volumes

        # run the container #
        docker run -p 3000:80 -d --name feedback-app-volumes --rm feedback:volumes
        ```

- Named Volumes

  - ```bash
    # build the img #
    docker build . -t feedback:volumes

    # run the container #
    docker run -p 3000:80 -d --name feedback-app-volumes --rm -v feedback:/app/feedback feedback:volumes
    ```
We saw, that anonymous volumes are **removed automatically**, when a container is removed.

This happens when you start / run a container with the `--rm` option.

If you start a container **without that option**, the anonymous volume would **NOT be removed**, even if you remove the container (with `docker rm ...`).

Still, if you then re-create and re-run the container (i.e. you run `docker run ...` again), a **new anonymous volume will be created**.So even though the anonymous volume wasn't removed automatically, it'll also **not be helpful** because a different anonymous volume is attached the next time the container starts (i.e. you removed the old container and run a new one).

Now you just start **piling up a bunch of unused anonymous volumes** - you can **clear them** via 

```bash
# delete a specific volume/s #
docker volume rm <VOL_NAME> 

# delete all volumes #
docker volume prune
```



