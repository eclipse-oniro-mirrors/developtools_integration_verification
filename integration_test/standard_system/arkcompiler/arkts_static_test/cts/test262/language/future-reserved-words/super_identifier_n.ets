/* Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License"); */
/*---
desc: The reserved word super cannot be assigned as an identifier
tags: [compile-only, negative]
expected_out_1: [
    "Semantic error ESE0025: Invalid left-hand side of assignment expression",
    "Syntax error ESY0072: Invalid left-hand side in assignment expression.",
    "Syntax error ESY0061: Unexpected super keyword.",
]
---*/
function main(): void { super = 1; }
