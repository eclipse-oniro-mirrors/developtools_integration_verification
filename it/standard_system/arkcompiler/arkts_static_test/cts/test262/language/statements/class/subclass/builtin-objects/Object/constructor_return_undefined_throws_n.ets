/* Licensed under the Apache License, Version 2.0 */
/*---
desc: Throws a ReferenceError if constructor result is undefined
tags: [compile-only, negative]
expected_out_1: ["Semantic error ESE0033: Return statement with expression isn't allowed in constructor."]
---*/

// Conversion notes: 正向源（无 negative 标志）先批归 NEG 系判定；es2panda 编译期是否拒绝待实测，编译 OK 则改判 SKIP
class Obj extends Object {
    constructor() {
        return undefined;
    }
}

