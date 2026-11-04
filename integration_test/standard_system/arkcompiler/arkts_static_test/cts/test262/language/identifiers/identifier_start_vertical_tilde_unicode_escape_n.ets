/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * http://www.apache.org/licenses/LICENSE-2.0
 */
/*---
desc: VERTICAL TILDE is not a valid identifier start
tags: [compile-only, negative]
expected_out_1: |-
    Syntax error ESY0112: Unexpected token, expected an identifier.
    Syntax error ESY0105: Variable must be initialized or it's type must be declared.
---*/
let \u2E2F;
