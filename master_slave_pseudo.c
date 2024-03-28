putchar1('M'); // If the robot receives a 'M' (for example, you can use other characters) it needs to send the metal detector status

// Wait for reply from robot WITH timeout:

timeout_cnt=0;
while(1)
{
    if(RXU1()) break; // Got something! Get out of loop.
    Timer3us(100); // Check if something has arrived every 100us
    timeout_cnt++;

    if(timeout_cnt>=1000) break; // timeout after 100ms, get out of loop
}

if(RXU1())

{

    getstr1(buff); // Read '\n' terminated string into array 'buff'
    if(strlen(buff)==5) // Assuming a good message from the robot has exactly 5 bytes
    {

        metal_value=atoi(buff);

        .

        .

        .

    }

}

//In the robot side, when it receives a 'M' it needs to send the metal detector status (for example, and again pseudo code for the EFM8):

if(RXU1())
{
    c=getchar1();

    if(c=='M') // Remote wants the status of the metal detector
    {

        waitms(5); // This delay between reception and transmission may be needed for reliable communication.
        sprintf(buff, "%05d\n", GetPeriod()); // printf() and friends take a lot of resources and time!  Replace if possible.
        sendstr1(buff);

    }

}