/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * http://www.apache.org/licenses/LICENSE-2.0
 */
/*---
desc: A generator declaration cannot be redeclared with const in a block
tags: [compile-only, negative]
expected_out_1: |-
    Syntax error ESY0135: Nested functions are not allowed.
---*/
{
    function* f(): void {}
    const f: int = 0
}
