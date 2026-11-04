/* Licensed under the Apache License, Version 2.0 */
/*---
desc: static class field forbid PropName 'constructor' (early error -- PropName of IdentifierName is forbidden)
tags: [compile-only, negative]
expected_out_1: [
    "Syntax error ESY0201: The modifier for a constructor should be limited to access modifiers (private, protected,
    public), and 'native' modifiers.",
    "Syntax error ESY0228: Unexpected token, expected '('.",
    "Semantic error ESE0017: Only abstract or native methods can't have body.",
    "Syntax error ESY0194: Parameter declaration should have an explicit type annotation.",
    "Syntax error ESY0229: Unexpected token, expected ',' or ')'.",
]
---*/

class C {
    static constructor: number;
}

