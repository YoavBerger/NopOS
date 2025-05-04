
# nopOS

**nopOS** is a minimalist operating system designed to be as simple and efficient as possible. The project is currently in its early stages, with the bootloader implemented. The idea is to focus on core OS concepts with minimal overhead.

## Current Status
Due to my focus on psychometric exams for university, progress has been slower than expected. However, I implemented the **bootloader**. The bootloader is responsible for loading the kernel into memory, enabling protected mode, and setting up a basic environment. Since I finished my exams, expect faster progress soon!

## How to Run
1. Make sure you have the following dependencies installed and up to date:
- qemu
- gcc 
- ld 
- nasm

2. Clone the repository:
    ```bash
    git clone https://github.com/yourusername/nopOS.git
    cd nopOS
    ```

3. Build the project using `make`, and runs it:
    ```bash
    make
    ```

This will boot the OS and load the bootloader, which will display basic output on the screen.

## Upcoming Features
I’m planning the following features for the next stages:

- **FAT32 File System Support**: Implementing a basic file system will allow for disk management and easier storage of files in the OS.
- **Memory Management Unit (MMU) + Paging**: Enabling paging would allow for better memory management, virtual memory, and protection. This is a more advanced feature and would make the OS more robust.
- **Kernel Mode and Drivers**: Setting up the kernel to handle system calls, input/output, and driver management.
- **Task Scheduling and Multitasking**: Implementing basic task scheduling to allow for multi-process execution. This will be done as an overhaul after finishing the Kernel Mode, to ensure I'm not overcomplicating things, as this is my first time building an OS.

