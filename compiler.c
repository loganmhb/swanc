#include <stdio.h>
#include "ast.h"


/* Simplest thing that could work:
 * read input from stdin and output asm on stdout.
 */

void print_ast_node(int level, struct ast_node *node) {
  puts("printing ast node");
  for(int i=0; i < level; i++) {
    putchar('-');
  }
  printf("node class: %d\n", node->class);
  switch (node->class) {
    case CONSTANT:
      printf("constant: %d\n", node->value);
      break;
    case RETURN:
      printf("return\n");
      print_ast_node(++level, node->return_value);
      break;
    case FUNCTION:
      printf("function %s:\n", node->function.name);
      print_ast_node(++level, node->function.body);
      break;
    }
}

extern struct ast_node *parse_result;

int main() {
  printf("yyparse result: %d", yyparse());
  print_ast_node(0, parse_result);
  return 0;
}
