/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * http://www.apache.org/licenses/LICENSE-2.0
 */
/*---
desc: Let declarations with initializers are not valid after a label
tags: [compile-only, negative]
expected_out_1: |-
    Syntax error ESY0038: Label must be followed by a loop statement.
---*/
label: let x = 1;
