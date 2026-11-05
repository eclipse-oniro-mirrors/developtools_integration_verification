/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0.
 */
/*---
tags: [compile-only, negative]
expected_out_1: [
    "Syntax error ESY0226: Import declarations can only be used on the top level and before any other declaration,
    top level statement or directive.",
    "Syntax error ESY0227: Unexpected token 'import'.",
    "Semantic error ESE0025: Invalid left-hand side of assignment expression",
    "Syntax error ESY0072: Invalid left-hand side in assignment expression.",
]
---*/
function main(): void { import() = 1; }
