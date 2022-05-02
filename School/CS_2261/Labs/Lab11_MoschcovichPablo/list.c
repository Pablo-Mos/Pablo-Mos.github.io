#include <stdlib.h>
#include <stdio.h>
#include <limits.h>
#include "list.h"

// Prototypes for static functions
static NODE *create_node(POSITION pos);

/** create_list
 *
 * Creates a list by allocating memory for it on the heap.
 * Be sure to initialize head and tail to NULL.
 *
 * @return pointer to an empty linked list
 */
LIST *create_list(void)
{
  // TODO 1.0: Complete this function
  // Make sure to handle the case where malloc cannot allocate enough memory for the list!
  LIST *newList = malloc(sizeof(LIST));
  if (newList)
  {
    newList->head = NULL;
    newList->tail = NULL;
  }
  return newList;
}

/** create_node
 *
 * Helper function that creates a node by allocating memory for it on the heap.
 * Be sure to set its pointers to NULL and to set the data
 *
 * @param pos a position to store in the list
 * @return pointer to a node
 */
static NODE *create_node(POSITION pos)
{
  // TODO 1.1: Complete this function
  // Make sure to handle the case where malloc cannot allocate enough memory for the list!
  NODE *newNode = malloc(sizeof(NODE));
  if (newNode)
  {
    newNode->pos = pos;
    newNode->prev = NULL;
    newNode->next = NULL;
  }
  return newNode;
}

/** push_front
 *
 * Adds the data to the front of the linked list
 *
 * @param dllist a pointer to the list
 * @param pos a position to store in the list
 */
void push_front(LIST *dllist, POSITION pos)
{
  NODE *pnode = create_node(pos);

  if (dllist->head != NULL)
  { // list isn't empty
    pnode->next = dllist->head;
    dllist->head->prev = pnode;
  }
  else
  { // list is empty
    dllist->tail = pnode;
  }

  dllist->head = pnode;
}

/** push_back
 *
 * Adds the data to the end of the linked list
 *
 * @param dllist a pointer to the list.
 * @param pos a position to store in the list
 */
void push_back(LIST *dllist, POSITION pos)
{
  // TODO 1.2: Complete this function
  // Don't forget to handle the empty list case!
  NODE *listNode = create_node(pos);
  if (!dllist->head)
  {
    dllist->head = listNode;
  }
  else
  {
    listNode->prev = dllist->tail;
    dllist->tail->next = listNode;
  }
  dllist->tail = listNode;
}

/** pop_front
 *
 * Removes the node at the front of the linked list and returns its value.
 * Popping an empty list returns (POSITION) {.col = 0, .row = 0};
 *
 * @param dllist a pointer to the list.
 */
POSITION pop_front(LIST *dllist)
{
  if (dllist->head == NULL)
  {
    return (POSITION){.col = 0, .row = 0};
  }
  POSITION toReturn = dllist->head->pos;
  NODE *toFree = dllist->head;
  dllist->head = dllist->head->next;
  if (dllist->head != NULL)
  {
    dllist->head->prev = NULL;
  }
  if (dllist->head == NULL)
  {
    dllist->tail = NULL;
  }
  free(toFree);
  return toReturn;
}

/** pop_back
 *
 * Removes the node at the back of the linked list
 *
 * Popping an empty list returns (POSITION) {.col = 0, .row = 0}
 * @param dllist a pointer to the list.
 */
POSITION pop_back(LIST *dllist)
{
  if (dllist->head == NULL || dllist->tail == NULL)
  {
    return (POSITION){.col = 0, .row = 0};
  }
  POSITION toReturn = dllist->tail->pos;
  NODE *toFree = dllist->tail;
  dllist->tail = dllist->tail->prev;
  if (dllist->tail == NULL)
  {
    dllist->head = NULL;
  }
  if (dllist->tail != NULL)
  {
    dllist->tail->next = NULL;
  }
  free(toFree);
  return toReturn;
}

/** size
 * Gets the number of nodes in the linked list
 *
 * @param dllist a pointer to the list
 * @return The size of the linked list
 */
int size(LIST *dllist)
{
  int size = 0;
  NODE *curr = dllist->head;
  while (curr != NULL)
  {
    size++;
    curr = curr->next;
  }
  return size;
}

/** empty_list
 *
 * Empties the list.  After this is called, the list should be empty.
 *
 * @param dllist a pointer to a linked list
 *
 */
void empty_list(LIST *dllist)
{
  while (dllist->head != NULL)
  {
    pop_front(dllist);
  }
  return;
}

/** updateNodePositions
 *
 * Starting from the back of the list, sets each node's pos to the previous node's pos.
 *
 * @param dllist a pointer to a linked list
 *
 */
void updateNodePositions(LIST *dllist)
{
  // TODO 2.0 : Complete this function
  NODE *curr = dllist->tail;
  while (curr && curr->prev)
  {
    curr->pos = curr->prev->pos;
    curr = curr->prev;
  }
}