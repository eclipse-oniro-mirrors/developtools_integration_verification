/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * http://www.apache.org/licenses/LICENSE-2.0
 */
/*---
desc: Numeric separators are not allowed in Unicode code point escapes
tags: [compile-only, negative]
expected_out_1: |-
    Syntax error ESY0091: Invalid Unicode escape.
    Syntax error ESY0112: Unexpected token, expected an identifier.
    Syntax error ESY0227: Unexpected token '}'.
    Syntax error ESY0105: Variable must be initialized or it's type must be declared.
---*/
let \u{00_76} = 1;
