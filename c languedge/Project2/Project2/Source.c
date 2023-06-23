#include<stdio.h>
#include<stdbool.h>

int pcount = 0;
int wtime = 0;
int Tcount = 0;
//--------------------------------------------- boolean declarations --------------------------------------------
bool emptyflag = false;
bool fullflag = false;
// ------------------------------------------- Function to add one in queue ------------------------------------- 
int enqueue() {
    if (pcount == 7) {
        fullflag = true;
        return (pcount = 7);
    }
    else
        return (pcount++);
}
// ------------------------------------------ Function to delete one from queue -------------------------------- 
int dequeue() {
    if (pcount == 0) {
        emptyflag = true;
        return (pcount = 0);
    }
    else
        return (pcount--);
}
// ----------------------------------------- Wtime Function ----------------------------------------------------
int Wtime(int count,int tcount) {
    int sum = 0;
    int result = 0;
    int counter = 0;
    if (pcount == 0) {
        return wtime = 0;
    }
    else {
        sum = count + tcount;
        sum -= 1;
        result = sum + sum + sum;
        while (result > 0) {
            result = result - tcount;
            counter++;
        }
        return wtime = counter;
    }
}
void Flags(int count) {
    // -------------------------------------------------------- Flags ---------------------------------------------------------------------------
    if (count == 7 && fullflag == 0)//full
        printf("------------------------------------------------ Queue Is FUll --------------------------------------------------------\n");

    else if (count == 0 && emptyflag == 0)//empty
        printf("------------------------------------------------ Queue Is EMPTY -------------------------------------------------------\n");

    else if (count == 7 && fullflag == 1)//overflow
        printf("-------------------------------------- Please,queue Is FUll Don`t press again! -----------------------------------------\n");

    else if (count == 0 && emptyflag == 1)//underflow
        printf("------------------------------------- Please,queue Is EMPTY Don`t press again! -----------------------------------------\n");

    fullflag = emptyflag = 0; //reset flags to 0
}
// ----------------------------------------- Counter and Flags function ------------------------------------------
void counter(int tellers, int choose) {

    while (choose == 1 || choose == 0 || choose == 9) {
        if (choose == 9)//reset pcount to inital value zero
        {
            pcount = 0;
            Wtime(pcount, tellers);
        }
        else if (choose == 1)//if someone enter the queue
        {
            enqueue();
            Wtime(pcount, tellers);
        }   
        else if (choose == 0)//if some one exit from queue
        {
            dequeue();
            Wtime(pcount, tellers);
        }

        printf("---------------------------------------- Number Of Clients in Queue: %ld ------------------------------------------------\n", pcount);
        printf("--------------------------------------------- And wateing time: %ld -----------------------------------------------------\n", wtime);
        
        // --------------------------------------------------- flags calling -----------------------------------------------------------
        Flags(pcount);

        printf("- To enter Queue press->  1\n- To leave Queue press->  0\n- To Reset press->        9\n- To ReEnter tellers press->  5\n");
        scanf_s("%d", &choose, 0);
        if (choose == 5)
        {
            printf("\n- Okey, enter the number of tellers\n");
            scanf_s("%d", &tellers, 0);
            printf("- To enter Queue press->  1\n- To leave Queue press->  0\n- To Reset press->        9\n- To ReEnter tellers press->  5\n");
            scanf_s("%d", &choose, 0);
        }
    }
}
//------------------------------------------ Main function -----------------------------------------------------
int main()
{
    int choose;
    int tellers;
    printf("\n- Please enter the number of tellers\n");
    scanf_s("%d", &tellers, 0);
    printf("- To enter Queue press->  1\n- To leave Queue press->  0\n- To Reset press->        9\n");
    scanf_s("%d", &choose, 0);
    counter(tellers, choose);
}