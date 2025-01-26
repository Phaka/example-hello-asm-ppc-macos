# Hello World in PowerPC Assembly (Mac OS X)

A minimal Hello World implementation in PowerPC assembly for Mac OS X systems, targeting G3/G4/G5 processors.

## Installation

### Mac OS X (PowerPC)
Install the development tools from your Mac OS X installation DVD or:
```bash
# If you have Xcode installed
gcc --version  # Verify PPC support
as --version   # Verify assembler support
```

## Building and Running

```bash
# Assemble
as hello.asm -o hello.o

# Link
ld -o hello hello.o -lSystem

# Run
./hello
```

## Code Explanation

The program demonstrates key aspects of PowerPC assembly on Mac OS X:

Register Usage:
- r0: Volatile register, used for syscall numbers
- r1: Stack pointer
- r3: First argument/return value register
- r4: Second argument register
- r5: Third argument register
- LR (Link Register): Return address storage

System Call Interface:
- Uses sc instruction for system calls
- System call number in r0
- Arguments in r3-r5
- Stack frame must be properly maintained

Memory Addressing:
- Uses @ha/@l for loading 32-bit addresses
- Proper stack frame creation/destruction
- Saves/restores link register

Note: This implementation specifically targets PowerPC-based Mac OS X systems (10.0-10.5). The last version of Mac OS X to support PowerPC was 10.5 (Leopard).
