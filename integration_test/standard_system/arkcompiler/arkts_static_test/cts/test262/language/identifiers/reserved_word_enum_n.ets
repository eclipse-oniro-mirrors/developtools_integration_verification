/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * http://www.apache.org/licenses/LICENSE-2.0
 */
/*---
desc: Reserved word enum cannot be used as an identifier
tags: [compile-only, negative]
expected_out_1: |-
    Syntax error ESY0126: Variable declaration expected.
    Syntax error ESY0224: Identifier expected, got '='.
    Syntax error ESY0228: Unexpected token, expected '{'.
    Syntax error ESY0224: Identifier expected, got ';'.
    Syntax error ESY0229: Unexpected token, expected ',' or '}'.
---*/
let enum = 123;
