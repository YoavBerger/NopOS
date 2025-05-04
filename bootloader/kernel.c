void main() {
    char* video_memory = (char*) 0xb8000;
	char message[] = "hello world";
    int i = 0;

    while (message[i] != '\0') {
        video_memory[i * 2] = message[i];  
        video_memory[i * 2 + 1] = 0x07; //colour      
        i++;
    }
}