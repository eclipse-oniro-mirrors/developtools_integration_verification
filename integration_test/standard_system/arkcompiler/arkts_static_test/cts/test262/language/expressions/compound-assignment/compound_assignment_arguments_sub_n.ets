/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0.
 */
/*---
tags: [compile-only, negative]
expected_out_1: [
    "Syntax error ESY0207: 'eval' or 'arguments' can't be defined or assigned to in strict mode code.",
    "Semantic error ESE0143: Unresolved reference arguments",
]
---*/
function main(): void { arguments -= 20; }
