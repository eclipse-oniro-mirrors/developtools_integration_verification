/* Licensed under the Apache License, Version 2.0 */
/*---
desc: The await token cannot be used as an identifier in ArkTS
tags: [compile-only, negative]
expected_out_1: |-
    Syntax error ESY0316: Hard keyword 'await' cannot be used as identifier
    Syntax error ESY0224: Identifier expected, got 'await'.
---*/
let await: int = 0;
