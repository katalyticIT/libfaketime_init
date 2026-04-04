
# libfaketime_init

Image for a init container which may be used to write libfaketime to a shared
volume - which may be loaded from there by the app container for "time travel".

## What is it about?

[libfaketime](https://github.com/wolfcw/libfaketime) is a library which modifies
the time for a process unde linux without affecting the rest of the system. It's
ideal to let containers/pods travel in time by using the LD_PRELOAD mechanism.

Using this image for an init container, you don't need to modify your app image.
Init and app container should share a volume into which the init container writes
and from where the app container loads the library - et voilá, you don't need
1.21 GW of power to move a pod back to 1985.

For an example how exactly it's done please see our repository [Marty McFly](https://github.com/katalyticIT/Marty-McFly).

## to be continued ...

