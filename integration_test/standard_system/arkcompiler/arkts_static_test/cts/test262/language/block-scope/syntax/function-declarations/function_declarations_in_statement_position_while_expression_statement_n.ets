/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * http://www.apache.org/licenses/LICENSE-2.0
 */
/*---
desc: Function declarations are not valid as a while statement body
tags: [compile-only, negative]
expected_out_1: |-
    Syntax error ESY0175: Lexical declaration is not allowed in single statement context.
    Syntax error ESY0135: Nested functions are not allowed.
    Syntax error ESY0300: Missing body in while statement
---*/
while (false) { function g(): void {} }
