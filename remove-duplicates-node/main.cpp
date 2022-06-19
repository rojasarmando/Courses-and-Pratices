#include <cstddef>
#include <cmath>
#include <cstdio>
#include <vector>
#include <iostream>
#include <algorithm>
using namespace std;	
class Node
{
    public:
        int data;
        Node *next;
        Node(int d){
            data=d;
            next=NULL;
        }
};
class Solution{
    public:

          Node* removeDuplicates(Node *head)
          { 
            struct Node *node1, *node2, *res, *dup;
            node1 = head;
            res = &*node1;
            
             while (node1 != NULL && node1->next != NULL){
                node2 = node1;
                while (node2->next != NULL){
                    // If duplicate then delete it 
                    if (node1->data == node2->next->data){
                        // sequence of steps is important here 
                        dup = node2->next;
                        node2->next = node2->next->next;
                        delete(dup);
                    }
                    else node2 = node2->next;
                }
                node1 = node1->next;
            }
            return res;     
          }

          Node* insert(Node *head,int data)
          {
               Node* p=new Node(data);
               if(head==NULL){
                   head=p;  

               }
               else if(head->next==NULL){
                   head->next=p;

               }
               else{
                   Node *start=head;
                   while(start->next!=NULL){
                       start=start->next;
                   }
                   start->next=p;   

               }
                    return head;
                
            
          }
          void display(Node *head)
          {
                  Node *start=head;
                    while(start)
                    {
                        cout<<start->data<<" ";
                        start=start->next;
                    }
           }
};
			
int main()
{
	Node* head=NULL;
  	Solution mylist;
    int T,data;
    cin>>T;
    while(T-->0){
        cin>>data;
        head=mylist.insert(head,data);
    }	
    head=mylist.removeDuplicates(head);

	mylist.display(head);
		
}
