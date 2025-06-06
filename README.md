## 📄 `README.md` برای `step01_assembler`

````markdown
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

```

