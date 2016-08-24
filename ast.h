/* Types for abstract syntax tree */

/*
 * struct ast_node can be either an integer or a return node.
 *
 */
#ifndef AST
#define AST

struct ast_node {
  enum { CONSTANT, RETURN, FUNCTION } class;
  union {
    /* value of an integer is stored immediately */
    int value;
    /* a RETURN node stores a pointer to the value it returns */
    struct ast_node *return_value;
    /* a FUNCTION node stores a pointer to the body of the function */
    struct {struct ast_node *body; char* name;} function;
  };
};

#endif
