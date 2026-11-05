/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * http://www.apache.org/licenses/LICENSE-2.0
 */
/*---
desc: Reserved word import formed with a four-digit Unicode escape cannot be an identifier
tags: [compile-only, negative]
expected_out_1: |-
    Syntax error ESY0271: Escape sequences are not allowed in keyword.
---*/
let \u0069mport = 123;
