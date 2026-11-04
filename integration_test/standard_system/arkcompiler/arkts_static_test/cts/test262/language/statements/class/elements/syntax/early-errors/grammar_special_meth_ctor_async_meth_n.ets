/* Licensed under the Apache License, Version 2.0 */
/*---
desc: Async Methods cannot be named "constructor" (class declaration)
tags: [compile-only, negative]
expected_out_1: [
    "Syntax error ESY0201: The modifier for a constructor should be limited to access modifiers (private, protected,
    public), and 'native' modifiers.",
    "Syntax error ESY0140: Type annotation isn't allowed for constructor.",
]
---*/

class C {
    async constructor(): Promise<void> {
    }
}

