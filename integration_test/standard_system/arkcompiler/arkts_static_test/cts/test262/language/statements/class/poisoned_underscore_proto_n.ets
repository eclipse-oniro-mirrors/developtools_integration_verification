/* Licensed under the Apache License, Version 2.0 */
/*---
desc: >
tags: [compile-only, negative]
expected_out_1: [
    "Semantic error ESE0087: Property 'defineProperty' does not exist on type 'Object'",
    "Syntax error ESY30818: Runtime prototype assignment is not supported because of static typing",
    "Semantic error ESE0176: The super type of 'A' class is not extensible.",
    "Semantic error ESE0170: Type 'Array<T>' is generic but type argument were not provided.",
]
---*/

// Conversion notes: P 源（`__proto__` 毒化 + extends Array）；extends Array 不可扩展（ESE0176），defineProperty 亦不可表达
Object.defineProperty(Object.prototype, '__proto__', {
    set: (): void => {
    }
});
class A extends Array {
}

