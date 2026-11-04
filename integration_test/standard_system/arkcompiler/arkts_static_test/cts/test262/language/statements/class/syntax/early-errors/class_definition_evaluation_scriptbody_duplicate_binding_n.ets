/* Licensed under the Apache License, Version 2.0 */
/*---
desc: >
tags: [compile-only, negative]
expected_out_1: [
    "Semantic error ESE0370: Merging declarations is not supported, please keep all definitions of classes,
    interfaces and enums compact in the codebase!",
    "Semantic error ESE0351: Variable 'A' has already been declared.",
]
---*/

class A {}
class A {}

