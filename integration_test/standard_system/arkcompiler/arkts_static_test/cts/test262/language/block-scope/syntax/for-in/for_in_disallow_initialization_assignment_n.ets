/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * http://www.apache.org/licenses/LICENSE-2.0
 */
/*---
desc: for-in declarations cannot use an initialization assignment
tags: [compile-only, negative]
expected_out_1: [
    "Syntax error ESY105822: 'in' operator is not supported. Use 'instanceof' operator to check whether an object is
    the instance of a class that contains the necessary class member.",
    "Syntax error ESY0230: Expected ';', got ')'.",
    "Syntax error ESY0167: Invalid left-hand side in 'For[In/Of]Statement'.",
]
---*/
for (let x: int = 3 in {}) { }
