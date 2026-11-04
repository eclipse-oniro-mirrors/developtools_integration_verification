/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * http://www.apache.org/licenses/LICENSE-2.0
 */
/*---
desc: A function declaration cannot be redeclared with a generator in a block
tags: [compile-only, negative]
expected_out_1: |-
    Syntax error ESY0135: Nested functions are not allowed.
    Syntax error ESY0135: Nested functions are not allowed.
---*/
{
    function f(): void {}
    function* f(): void {}
}
