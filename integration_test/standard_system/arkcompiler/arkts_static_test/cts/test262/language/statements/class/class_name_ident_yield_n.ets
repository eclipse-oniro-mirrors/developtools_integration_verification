/* Licensed under the Apache License, Version 2.0 */
/*---
desc: >
tags: [compile-only, negative]
expected_out_1: ["Syntax error ESY0145: Cannot be used as user-defined type."]
---*/

// Conversion notes: `yield` 不能作为用户自定义类型名（ESY0145）
interface yield {}

