memory = {
    "A": 0,
    "B": 0,
    "C": 0
}
addr_to_var = {
    "00": "A",
    "01": "B",
    "02": "C"
}
ACC = 0  

def run_program(file_path):
    global ACC
    
    with open(file_path, "r") as f:
        lines = f.readlines()
    print("🚀 Running VDOS Bytecode:\n")
        
    for line in lines:
        op, val = line.strip().split()
        if op == "01":  # LOAD
            ACC = int(val, 16)
            print(f"🔹 LOAD {ACC}")
        elif op == "02":  # ADD
            ACC += int(val, 16)
            print(f"➕ ADD → ACC = {ACC}")
        elif op == "03":  # STORE
            var_name = addr_to_var.get(val, "?")
            if var_name == "?":
                print(f"❌ Unknown address {val}")
            else:
                memory[var_name] = ACC
                print(f"💾 STORE ACC ({ACC}) → {var_name}")
        elif op == "FF":  # HALT
            print("⛔ HALT\n")
            break
        else:
            print(f"❓ Unknown opcode: {op}")

    print("\n📦 Final Memory State:")
    for var, val in memory.items():
        print(f"🧠 {var} = {val}")

if __name__ == "__main__":
    run_program("program.vdos")