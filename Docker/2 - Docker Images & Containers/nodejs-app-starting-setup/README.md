### EXPOSE & A Little Utility Functionality

In the last lecture, we started a container which also **exposed** a port (port 80).

I just want to clarify again, that `EXPOSE 80` in the `Dockerfile` in the end is optional. It documents that a process in the container will expose this port. But you still need to then actually expose the port with `-p` when running docker run. So technically, `-p` is the **only required part** when it comes to listening on a port. Still, it is a best practice to also add `EXPOSE` in the `Dockerfile` to document this behavior.

As an additional **quick side-note**: For **all docker commands** where an **ID** can be used, **you don't always have to copy / write** out the **full id**.

You can also **just use the first (few) character(s)** - just enough to have a unique identifier.

So instead of

```bash
docker run abcdefg
```

you could also run

```bash
docker run abc
```

or, if there's no other image ID starting with "a", you could even run just:

```bash
docker run a
```

**This applies to ALL Docker commands where IDs are needed.**
