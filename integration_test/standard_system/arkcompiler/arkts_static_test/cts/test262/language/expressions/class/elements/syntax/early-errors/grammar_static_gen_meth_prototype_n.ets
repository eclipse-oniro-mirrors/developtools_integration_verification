/* Licensed under the Apache License, Version 2.0 */
/*---
desc: Static Generator Methods cannot be named prototype (class expression)
tags: [compile-only, negative]
expected_out_1: ["Syntax error ESY0227: Unexpected token '*'."]
---*/

class C {
    static * prototype(): void {
    }
}

