/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * http://www.apache.org/licenses/LICENSE-2.0
 */
/*---
desc: Reserved word while formed with Unicode escapes cannot be an identifier
tags: [compile-only, negative]
expected_out_1: |-
    Syntax error ESY0271: Escape sequences are not allowed in keyword.
---*/
let \u{77}\u{68}\u{69}\u{6c}\u{65} = 123;
