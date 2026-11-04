/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * http://www.apache.org/licenses/LICENSE-2.0
 */
/*---
desc: The "this" is a reserved word; assigning to it fails to compile
tags: [compile-only, negative]
expected_out_1: |-
    Semantic error ESE0202: 'this' cannot be referenced from a static context
    Semantic error ESE0025: Invalid left-hand side of assignment expression
    Syntax error ESY0072: Invalid left-hand side in assignment expression.
---*/
this = 1;
