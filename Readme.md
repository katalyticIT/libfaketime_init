
# libfaketime_init

Image for a init container which may be used to write libfaketime to a shared
volume - which may be loaded from there by the app container for "time travel".

## What is it about?

[libfaketime](https://github.com/wolfcw/libfaketime) is a library which modifies
the time for a process under linux without affecting the rest of the system. It's
ideal to let containers/pods travel in time by using the LD_PRELOAD mechanism.

Using this image for an init container, *you don't need to modify your app image.*
Init and app container should share a volume into which the init container writes
and from where the app container loads the library - et voilá, you don't need
1.21 GW of power to move a pod back to 1985.

For an example how exactly it's done please see our repository [Marty McFly](https://github.com/katalyticIT/Marty-McFly).

![Twin Pines Mall Parkin Lot 1985](img/Delorean_Libfaketime_init.jpg "You won't need plutonium to move containers through time.")

## License
This project is published unter the GNU General Public License v3.0.
For details please see the LICENSE file.

## docker compose demo

In the folder examples you'll find a docker compose file which
demonstrates the principle of inserting libfaketime via an init
container. It starts two containers:

* the init container which mounts the shared volume and copies
  libfaketime there. It runs first.
* the app container. It gets started after the init container
  is finished. The environment variable LD_PRELOAD is set to
  the path of libfaketime so that it gets loaded *before* the
  application, thus able to intercept system calls regerding
  time and to modify the "clock".

To test it simply run

```
# start
docker compose -f examples/docker-compose.yaml up
# break with ctrl-c; then remove containers:
docker compose -f examples/docker-compose.yaml down
```
# AI notice
There have no AI tools been involved in developing this project.
