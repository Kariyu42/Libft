# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: kquetat- <kquetat-@student.42nice.fr>      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/04/11 07:24:40 by kquetat-          #+#    #+#              #
#    Updated: 2023/04/11 10:57:37 by kquetat-         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

### Colors ###
GREEN		=\033[0;32m
VIOLET		=\033[0;35m
BLUE		=\033[0;36m
GRAY		=\033[0;37m
BEIGE		=\033[38;5;223m
RESET		=\033[0m
BOLD		=\033[1m
ITALIC		=\033[3m

### Library name and path ###
NAME		=	libft.a
HEADER		=	includes
SRCS_PATH	=	srcs/

### Source files ###
SRCS 	= 	${addprefix ${SRCS_PATH}, ft_isalpha.c ft_isdigit.c ft_isalnum.c \
			ft_isascii.c ft_isprint.c ft_strlen.c ft_memset.c ft_bzero.c \
			ft_memcpy.c ft_memchr.c ft_memmove.c ft_toupper.c ft_tolower.c \
			ft_strlcpy.c ft_strlcat.c ft_strchr.c ft_strrchr.c ft_strncmp.c \
			ft_memcmp.c ft_strnstr.c ft_atoi.c ft_calloc.c ft_strdup.c \
			ft_substr.c ft_strjoin.c ft_putchar_fd.c ft_putstr_fd.c \
			ft_putendl_fd.c ft_putnbr_fd.c ft_strtrim.c ft_split.c ft_itoa.c \
			ft_strmapi.c ft_striteri.c}

### Bonus files (linked list functions) ###
SRCS_BONUS =	${addprefix ${SRCS_PATH}, ft_lstnew.c ft_lstadd_front.c \
				ft_lstsize.c ft_lstlast.c ft_lstadd_back.c ft_lstdelone.c \
				ft_lstclear.c ft_lstiter.c ft_lstmap.c}

### Compilation and flags ###
CC		=	gcc
CFLAGS 	=	-Wall -Wextra -Werror -I$(HEADER)

%.o: %.c
	@$(CC) $(CFLAGS) -c $< -o $@
	@printf "$(BLUE)$(BOLD)$(ITALIC)-> Compiling$(GREEN)$(BOLD)[LIBFT] => $(RESET)""$(BEIGE) <$<> \033[K\r$(RESET)"

### Object files for the library ###
OBJ			=	$(SRCS:.c=.o)
OBJ_BONUS	=	$(SRCS_BONUS:.c=.o)

### Remove files ###
RM	=	rm -f

### Rules ###
all:		$(NAME)

$(NAME):	$(OBJ)
	@echo "\n"
	@printf "\n\t$(BEIGE)$(BOLD)$(ITALIC)LIBFT files compiled$(RESET) ✨\n\n"
	@ar rcs $(NAME) $(OBJ)
	@printf "$(BOLD)$(ITALIC)$(LGREEN)Libft.a built successfully$(RESET) ✅\n"

bonus:		$(OBJ) $(OBJ_BONUS)
	@echo "\n"
	@printf "\n\n\t$(BEIGE)$(BOLD)$(ITALIC)LIBFT files + bonus compiled$(RESET) ✨\n\n"
	@ar rcs $(NAME) $(OBJ) $(OBJ_BONUS)
	@printf "$(GREEN)$(BOLD)$(ITALIC)Libft.a built successfully$(RESET) ✅\n"

clean:
	@$(RM) $(OBJ) $(OBJ_BONUS)
	@printf "\n\t$(VIOLET)$(BOLD)$(ITALIC)Libft object files removed$(RESET) ... ❌\n\n"

fclean:	clean
	@$(RM) $(NAME) $(OBJ_BONUS)
	@printf "\n\t$(VIOLET)$(BOLD)$(ITALIC)Libft.a removed$(RESET) ... ❌\n\n"

re:	fclean all

.PHONY:	all clean fclean re bonus