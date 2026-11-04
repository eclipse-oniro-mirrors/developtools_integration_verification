/* Licensed under the Apache License, Version 2.0 */
/*---
desc: Invalid FieldDefinition, ClassElementName, PropertyName Syntax (class declaration)
tags: [compile-only, negative]
expected_out_1: ["Syntax error ESY0112: Unexpected token, expected an identifier."]
---*/

class C {
    \u200D_ZWJ: number;
}

