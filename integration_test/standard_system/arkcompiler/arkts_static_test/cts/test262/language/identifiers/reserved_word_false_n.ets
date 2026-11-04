/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * http://www.apache.org/licenses/LICENSE-2.0
 */
/*---
desc: Reserved word false cannot be used as an identifier
tags: [compile-only, negative]
expected_out_1: [
    "Syntax error ESY0224: Identifier expected, got 'false'.",
    "Syntax error ESY0315: Number, string or computed value property name 'false' is not allowed, use classes to
    access data by property names that are identifiers",
]
---*/
let false = 123;
