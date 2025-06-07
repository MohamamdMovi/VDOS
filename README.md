


# Step 01: Simple Assembler and Virtual Machine for VDOS 🧠💾

## 🎯 Goal
In this first step of the **VDOS Operating System Project**, we simulate how early CPUs worked in the 1950s by:
- Creating a simple Assembly language
- Writing a Python-based assembler to convert it to bytecode
- Implementing a virtual machine (VM) to execute this bytecode

---

## 🧱 Assembly Language Syntax

The assembly syntax supports four basic instructions:

```asm
LOAD 5       ; Load number into register
ADD 3        ; Add number to register
STORE A      ; Store value in memory A
HALT         ; Stop execution
````

---

## ⚙️ Opcode Table

| Instruction | Opcode | Operand Meaning       |
| ----------- | ------ | --------------------- |
| `LOAD`      | `01`   | Value to load         |
| `ADD`       | `02`   | Value to add          |
| `STORE`     | `03`   | Variable (A, B, C...) |
| `HALT`      | `FF`   | No operand needed     |

Each instruction takes **2 bytes** in the final bytecode.

---

## 📁 Files

| File           | Purpose                             |
| -------------- | ----------------------------------- |
| `example.asm`  | Example input in VDOS Assembly      |
| `assembler.py` | Converts `.asm` → `.vdos` bytecode  |
| `program.vdos` | Output bytecode from the assembler  |
| `vm.py`        | Virtual machine to run the bytecode |

---

## 🧪 How to Run

```bash
# Step 1: Assemble
python assembler.py

# Step 2: Run the bytecode in VM
python vm.py
```

---

## ✅ Output Example

```
🔹 LOAD 5
➕ ADD → ACC = 8
💾 STORE ACC (8) → A
...
📦 Final Memory State:
🧠 A = 8
🧠 B = 6
🧠 C = 0
```

---

## 📚 Concepts Learned

* How early CPUs executed simple instruction sets
* Binary translation from human-readable commands to bytecode
* Simulated memory and register operations

---

## 📅 Date

**Started:** 2025-06-06
**Stage:** ✅ Completed – Assembler + VM Functional

---
# Step 02: Real Bootloader for VDOS 💽🧠

## 🎯 Goal
Create a **real boot sector** that runs directly on virtual hardware, prints a message via BIOS interrupts, and halts the CPU.

---

## ⚙️ How It Works

When a PC boots, BIOS loads the first sector (512 bytes) of the bootable device into memory at `0x7C00` and jumps to it.

This bootloader:
- Displays a welcome message using BIOS interrupt `int 0x10`
- Halts the CPU
- Includes the required boot signature `0xAA55`

---

## 🧾 Code Overview (boot.asm)

```nasm
[BITS 16]
[ORG 0x7C00]

start:
    mov si, message

print_loop:
    lodsb
    or al, al
    jz hang
    mov ah, 0x0E
    int 0x10
    jmp print_loop

hang:
    cli
    hlt

message db "🟢 VDOS Booting Successfully!", 0
times 510 - ($ - $$) db 0
dw 0xAA55
````

---

## 🧪 How to Build & Run

### 🔧 Build with NASM

```bash
nasm -f bin boot.asm -o boot.img
```

### 🚀 Run with QEMU

```bash
qemu-system-x86_64 -drive format=raw,file=boot.img
```

You should see:

```
🟢 VDOS Booting Successfully!
```

---

## 💡 Concepts Covered

* Real Mode (16-bit)
* BIOS interrupts
* Boot sector layout (ORG 0x7C00 + signature 0xAA55)
* ASCII output via VGA teletype

---

## 📅 Date

**Completed:** 2025-06-06
**Next Step:** ⌨ Keyboard interrupts + Shell + File loading


دمت گرم محمد جان! 💪
بزن بریم برای مستندسازی حرفه‌ای مرحله ۳:

---


## 📄 README.md for `step03_keyboard_shell`


# Step 03: Minimal Shell with Keyboard Input ⌨️🧠

## 🎯 Goal

In this step, we simulate an early shell by:
- Displaying a welcome message
- Reading raw keyboard input
- Echoing user input in real-time

This mimics how early OSes like MS-DOS interacted with the user via BIOS services.

---

## 📂 Files

| File        | Description                              |
|-------------|------------------------------------------|
| `shell.asm` | 16-bit x86 assembly for the VDOS shell   |
| `shell.img` | Bootable binary image (512 bytes)        |

---

## ⚙️ Key BIOS Interrupts Used

| Interrupt | Purpose              |
|-----------|----------------------|
| `int 10h` | Text output to screen|
| `int 16h` | Keyboard input       |

---

## 💻 Code Behavior

- Program starts at `0x7C00`
- Prints `"Welcome to VDOS Shell"` message
- Waits for a keypress and immediately prints it
- Repeats infinitely to simulate an interactive loop

---

## 🧪 How to Run

### Build the shell image:

```bash
nasm -f bin shell.asm -o shell.img
````

### Run in QEMU:

```bash
qemu-system-x86_64 -drive format=raw,file=shell.img
```

---

## ✅ Output Example

```
🔷 Welcome to VDOS Shell
Type anything:
> [you type: hello]
> hello
```

---

## 📚 Concepts Learned

* Real Mode keyboard interrupts (`int 16h`)
* VGA text mode output (`int 10h`)
* Shell loop simulation
* Bootable image creation with NASM

---

## ⏭️ Next Steps

* Implement simple command parsing (e.g., `help`, `clear`)
* Start loading static files from floppy image
* Begin working with file systems like FAT12

📅 Completed on: 2025-06-06

````

