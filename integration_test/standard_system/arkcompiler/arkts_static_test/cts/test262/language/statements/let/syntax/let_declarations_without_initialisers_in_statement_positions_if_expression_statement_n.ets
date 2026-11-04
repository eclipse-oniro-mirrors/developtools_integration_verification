/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * http://www.apache.org/licenses/LICENSE-2.0
 */
/*---
desc: Let declarations without initializers are not valid as an if body
tags: [compile-only, negative]
expected_out_1: |-
    Syntax error ESY0105: Variable must be initialized or it's type must be declared.
---*/
if (true) { let x; }
