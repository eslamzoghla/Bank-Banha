# Bank-Banha
This is Banha bank's system. Its content 2 different programming language (verlog, and C)

## Abstract
The purpose of the project is an embedded system to monitor the client queue in front of the tellers.
Three employees in front of them are a line consisting of 7 clients. Both ends of the queue are equipped with photocells. Each photocell generates a logic signal "1" if no one interrupts the beam of light generated at the corresponding end of the queue. When the light beam is interrupted, the output of the photocell changes to logic "0" and remains at this value until it is not interrupted anymore. Customers enter from the end and leave from the front. The number of customers in the queue displays the waiting time on seven segments. The number of customers will only increase by one when entering a customer and the number of customers will decrease by only one when a customer exits. The waiting time will be calculated from the relationship: -
• Wtime (Pcount = 0) = 0, Wtime (Pcount ≠ 0,Tcount) = 3*(Pcount+Tcount-1)/Tcount
(where Tcount is the number of tellers currently in service (Tcount ∈ {1,2,3}) and Wtime(waiting time) is rounded by ignoring the fraction part)
The responsible person should have the ability to reset the system. Resetting the file system clears the full tag and Pcount, and the tag groups are empty (use reset). We will use programmable read-only memory (ROM) to take the waiting time and number of clients.

## Show running of project in FPGA
As shown in video at first i made switch up which is mean that there are people enter the queue when the 7's client is enterned an fill alarm is on, then i made switch down which is lead to leave queue, when last client was leaved an empty alarm is on.
two left 7 segment lead to time taken for all clients in queue.

https://github.com/eslamzoghla/Bank-Banha/assets/95759229/1e6671ef-6ecb-4a56-8e47-115e0ad2153f

