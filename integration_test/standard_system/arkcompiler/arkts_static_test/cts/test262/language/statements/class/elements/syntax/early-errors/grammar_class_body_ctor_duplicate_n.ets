/* Licensed under the Apache License, Version 2.0 */
/*---
desc: It is a SyntaxError if the class body has more than one constructor (class declaration)
tags: [compile-only, negative]
expected_out_1: ["Semantic error ESE0130: Function constructor is already declared."]
---*/

class C {
    constructor() {
    }
    constructor() {
    }
}

