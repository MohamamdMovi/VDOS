# assembler.py - تبدیل زبان اسمبلی ساده به بایت‌کد

opcode_table = {
    "LOAD": "01",
    "ADD": "02",
    "STORE": "03",
    "HALT": "FF"
}

variable_table = {
    "A": "00",
    "B": "01",
    "C": "02"
}


def assemble_line(line):
      line = line.strip().split(";")[0]  # حذف کامنت
      if not line:
            return None
      parts = line.split()
      instr = parts[0].upper()
      arg = parts[1] if len(parts) > 1 else "00"
    
      op = opcode_table.get(instr)
      if op is None:
        raise ValueError(f"Unknown instruction: {instr}")
      
      if instr == "STORE":
          operand = variable_table.get(arg.upper(), "FF")
      elif instr == "HALT":
          operand = "00"
      else:
          operand = f"{int(arg):02X}"

      return f"{op} {operand}"    

def assemble_file(file_path):
    with open(file_path, "r") as f:
        lines = f.readlines()

    bytecode = []
    for line in lines:
        assembled = assemble_line(line)
        if assembled:
            bytecode.append(assembled)

    return bytecode

if __name__ == "__main__":
    bytecode = assemble_file("example.asm")
    with open("program.vdos", "w") as f:
        for line in bytecode:
            f.write(line + "\n")
    print("✅ Bytecode written to program.vdos")