/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 */
/*---
desc: Unicode escapes cannot express minus as a punctuator
tags: [compile-only, negative]
expected_out_1: |-
    Syntax error ESY0227: Unexpected token '-2'.
    Syntax error ESY0112: Unexpected token, expected an identifier.
    Semantic error ESE0143: Unresolved reference -2
---*/
function main(): void {
    1\u002D2;
}
