/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * http://www.apache.org/licenses/LICENSE-2.0
 */
/*---
desc: Reserved word break formed with Unicode escapes cannot be an identifier
tags: [compile-only, negative]
expected_out_1: |-
    Syntax error ESY0271: Escape sequences are not allowed in keyword.
---*/
let \u{62}\u{72}\u{65}\u{61}\u{6b} = 123;
