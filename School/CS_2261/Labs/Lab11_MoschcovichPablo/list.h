#ifndef LIST_H
#define LIST_H

typedef struct position {
	int col;
	int row;
} POSITION;

// Struct for a node for a doubly-linked list
typedef struct dlnode {
	struct dlnode* prev;
	struct dlnode* next;
	POSITION pos;
} NODE;

// Struct for a doubly-linked list
typedef struct dllist {
	struct dlnode *head;
	struct dlnode *tail;
} LIST; 

// Typedef for function pointer to fn that takes in a void * and return int *
typedef int (*list_operation)(int x);


// ================================ Prototypes ================================

// Create a new list
LIST *create_list(void);

// Add a new element to the list
void push_front(LIST *dllist, POSITION pos);
void push_back(LIST *dllist, POSITION pos);

// Remove a node from the list and returns its data
POSITION pop_front(LIST *dllist);
POSITION pop_back(LIST *dllist);

// Get the size of the linked list
int size(LIST *dllist);

// Clear out a list and free all nodes, but not the list itself
void empty_list(LIST *dllist);

void updateNodePositions(LIST *dlllist);


#endif
