/* Licensed under the Apache License, Version 2.0 */
/*---
desc: The "Return" parsing context does not apply to the block's statement list
tags: [compile-only, negative]
expected_out_1: ["Syntax error ESY0040: Illegal start of CLASS expression."]
---*/

// Conversion notes: static 块内 return（capture 实测）
function f(): void {
    class C {
        static {
            return;
        }
    }
}

