/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0.
 */
/*---
tags: [compile-only, negative]
expected_out_1: [
    "Semantic error ESE0108: Bad operand type, the types of the operands must be numeric type, enum or String.",
    "Semantic error ESE0025: Invalid left-hand side of assignment expression",
    "Semantic error ESE0346: Wrong type of operands for binary expression",
    "Syntax error ESY0072: Invalid left-hand side in assignment expression.",
]
---*/
function main(): void { true - false = 1; }
