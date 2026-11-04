/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 */
/*---
desc: Unicode escapes cannot express braces as punctuators
tags: [compile-only, negative]
expected_out_1: |-
    Syntax error ESY0263: Invalid identifier part.
    Syntax error ESY0112: Unexpected token, expected an identifier.
    Semantic error ESE0143: Unresolved reference {}
---*/
function main(): void {
    \u007B\u007D;
}
