#include <stdlib.h>
#include <stdio.h>

typedef struct node
{
    int procID;

    int releaseTime;

    int priority;

    int cpuTime;

    int executedTime;

    int state;

    struct node *next;
} PCB;

PCB *ready, *wait, *run;

firstin()
{
    run = ready;
    run->state = 1;
    ready = ready->next;
}

insert1(PCB *q)
{
    PCB *p1, *s, *r;
    int b;
    s = q;
    p1 = ready;
    r = p1;
    b = 1;
    while ((p1 != NULL) && b)
        if (p1->priority >= s->priority)
        {
            r = p1;
            p1 = p1->next;
        }
        else
            b = 0;
    if (r != p1)
    {
        r->next = s;
        s->next = p1;
    }
    else
    {
        s->next = p1;
        ready = s;
    }
}

void create()
{
    PCB *p;
    ready = NULL;
    wait = NULL;
    run = NULL;
    int i;
    printf("输入进程号和运行时间：\n");
    for (i = 1; i <= 4; i++)
    {
        p = (PCB *)malloc(sizeof(PCB));
        scanf("%d %d %d %d", &p->procID, &p->releaseTime, &p->priority, &p->cpuTime);
        }
}