/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 */
/*---
desc: Unicode escapes cannot express dot as a punctuator
tags: [compile-only, negative]
expected_out_1: |-
    Semantic error ESE0203: Cannot reference 'this' in this context.
    Syntax error ESY0227: Unexpected token '.x'.
    Syntax error ESY0112: Unexpected token, expected an identifier.
    Semantic error ESE0143: Unresolved reference .x
---*/
function main(): void {
    let x: int = 1;
    x = 1;
    this\u002Ex;
}
