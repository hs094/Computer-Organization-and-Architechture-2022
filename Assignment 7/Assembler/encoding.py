OPCODE = {
    "add": 0, "comp": 0,
    "and": 1, "xor": 1,
    "diff": 2,
    "shll": 3, "shllv": 3,
    "shrl": 3, "shrlv": 3,
    "shra": 3, "shrav": 3,
    "lw": 5, "sw": 6,
    "b": 8,
    "bl": 9,
    "bcy": 10,
    "bncy": 11,
    "br": 16,
    "bltz": 17,
    "bz": 18,
    "bnz": 19,
    "addi": 32,
    "compi": 33,
}

REFORMATS = {
    "add", "comp",
    "and", "xor",
    "shllv", "shrlv",
    "shrav",
    "diff",
}

FUNCODE = {
    "add": 0, "comp": 1,
    "and": 0, "xor": 1,
    "diff": 0,
    "shll": 0, "shllv": 1,
    "shrl": 2, "shrlv": 3,
    "shra": 4, "shrav": 5,
}
