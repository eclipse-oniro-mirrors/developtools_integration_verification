/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * http://www.apache.org/licenses/LICENSE-2.0
 */
/*---
desc: Duplicate generator declarations in a block are invalid syntax
tags: [compile-only, negative]
expected_out_1: |-
    Syntax error ESY0135: Nested functions are not allowed.
    Syntax error ESY0135: Nested functions are not allowed.
---*/
{
    function* f(): void {}
    function* f(): void {}
}
