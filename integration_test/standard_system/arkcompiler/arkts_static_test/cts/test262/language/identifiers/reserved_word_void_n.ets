/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * http://www.apache.org/licenses/LICENSE-2.0
 */
/*---
desc: Reserved word void cannot be used as an identifier
tags: [compile-only, negative]
expected_out_1: |-
    Syntax error ESY0295: void is a predefined type, cannot be used as an identifier
---*/
let void = 123;
