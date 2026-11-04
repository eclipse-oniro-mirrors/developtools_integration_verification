/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0.
 */
/*---
tags: [compile-only, negative]
expected_out_1: [
    "Semantic error ESE0025: Invalid left-hand side of assignment expression",
    "Syntax error ESY0072: Invalid left-hand side in assignment expression.",
]
---*/
function main(): void { 1 -= 1; }
