/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * http://www.apache.org/licenses/LICENSE-2.0
 */
/*---
desc: Reserved word switch cannot be used as an identifier
tags: [compile-only, negative]
expected_out_1: |-
    Syntax error ESY0316: Hard keyword 'switch' cannot be used as identifier
    Syntax error ESY0224: Identifier expected, got 'switch'.
---*/
let switch = 123;
