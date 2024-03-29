#include <stdio.h>
#include <sys/types.h>
#include <sys/shm.h>
#include <sys/stat.h>
#include <unistd.h>
#include <stdlib.h>

int main()
{
    int segment_id;
    char *shared_memory;
    const int size = 4000;

    segment_id = shmget(IPC_PRIVATE, size, S_IRUSR | S_IWUSR);
    shared_memory = (char *)shmat(segment_id, NULL, 0);

    pid_t pid = fork();
    if (pid == 0)
    {
        shared_memory = (char *)shmat(segment_id, NULL, 0);
        printf("Child Write: Hi There!\n");
        sprintf(shared_memory, "Hi There!");
    }
    else
    {

        printf("Parent Read: %s\n", shared_memory);
        shmdt(shared_memory);
        shmctl(segment_id, IPC_RMID, NULL);
    }
    return 0;
}