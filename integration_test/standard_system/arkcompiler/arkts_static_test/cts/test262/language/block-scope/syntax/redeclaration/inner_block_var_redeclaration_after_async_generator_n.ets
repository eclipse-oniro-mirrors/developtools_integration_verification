/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * http://www.apache.org/licenses/LICENSE-2.0
 */
/*---
desc: An inner-block var cannot follow an async generator declaration
tags: [compile-only, negative]
expected_out_1: |-
    Syntax error ESY0320: Function expressions are not supported, use arrow functions instead
    Syntax error ESY0314: Generator functions are not supported, please use async/await mechanism for multitasking
    Syntax error ESY0297: 'var' keyword is not supported. Use 'let' instead.
---*/
{
    async function* f(): void {}
    { var f: int }
}
