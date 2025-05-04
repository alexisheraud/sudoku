GREEN = \033[0;32m
RED = \033[0;31m
BLUE = \033[0;34m
YELLOW = \033[0;33m
NC = \033[0m

SRC	=	main.c

CFLAGS = -Iinclude -W -Wall -Wextra -Wshadow

NAME = sudoku

OBJ = $(SRC:%.c=%.o)

all: $(NAME)

$(NAME): $(OBJ)
	@$(CC) $(OBJ) -o $(NAME) $(LDFLAGS) $(CFLAGS) $(CSFML)
	@printf "\n${GREEN}[Message]${NC} Compilation done\n"

.c.o:
	@printf "${BLUE}[Compilation]${NC} $<\n"
	@$(CC) $(CFLAGS) -c $< -o $@

clean:
	@$(RM) -f $(OBJ)
	@printf " ${RED}[Delete]${NC} %s\n" $(OBJ)

fclean: clean
	@$(RM) -f $(NAME)
	@$(RM) -f *.log
	@printf " ${RED}[Delete]${NC} %s\n" $(NAME)

re: fclean all

run: re
	./$(NAME)

.PHONY: all clean fclean re