 #include <stdio.h>

int _getMax(int* buffer, int buffer_size)
{
    int i, max;

    max = buffer[0];  //initialize the max variable
    //Example: retrieving element from an array passed in as argument

    //starts at index 1
    for(i = 1; i < buffer_size; i++)
    {
        printf("[%d] = %d\n", i, buffer[i]);
    }
    
    //Return the largest value in the array
    return max;
}

int main()
{
    int samples[16] = { 24, 236, 25, 121, 157, 136, 187, 62, 56, 250, 114, 197, 211, 86, 0, 1 };
    int max;
    
    max = _getMax(&samples[0], 16);
    printf("max value of sample array: %d\n", max);
    
    return 0;
}
