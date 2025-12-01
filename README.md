# Libft 📚

A C library of common utility functions (strings, memory, linked lists, and a ft_printf implementation) used across projects.

## Commands

### Build

From the libft directory:

```bash
make
```

This produces `libft.a` and an `obj/` directory with object files.

### Cleaning

From the libft directory to remove the objects and its directory:

```bash
make clean
```

And, one command to remove objects directory as well as the binary `libft.a`:

```bash
make fclean
```

### Rebuild

Removes by using `fclean` and rebuilds:

```bash
make re
```

## Include headers

Add the library `inc` directory to your compiler include path. Examples:

- Use `-I` pointing to the repo `inc` directory (recommended):
  -gcc flag: `-I/path/to/Libft/inc`
- Then include headers in your sources:

```c
#include "libft/libft.h"
#include "ft_printf/ft_printf.h"
```

## Link the library

Examples showing two common ways to link the static archive:

1. Link by full path:

```bash
gcc -I/path/to/Libft/inc main.c /path/to/Libft/libft.a -o main
```

2. Use -L and -l:

```bash
gcc -I/path/to/Libft/inc main.c -L/path/to/Libft -lft -o main
# note: libft.a -> -lft
```

Important: put your object/source files before `-lft` so the linker resolves symbols.

## Example Makefile snippet

```makefile
CC = gcc
CFLAGS = -Wall -Wextra -I../Libft/inc
LDFLAGS = -L../Libft -lft

main: main.o
    $(CC) $(CFLAGS) main.o $(LDFLAGS) -o main

main.o: main.c
    $(CC) $(CFLAGS) -c main.c -o main

.PHONY: libft
libft:
    $(MAKE) -C ../Libft
```
