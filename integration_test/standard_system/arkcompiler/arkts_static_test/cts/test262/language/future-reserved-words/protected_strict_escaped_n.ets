/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 */

/*---
desc: A Unicode escape cannot form the reserved word protected in strict code
tags: [compile-only, negative]
expected_out_1: ["Syntax error ESY0271: Escape sequences are not allowed in keyword."]
---*/
function main(): void {
    let \u0070\u0072\u006f\u0074\u0065\u0063\u0074\u0065\u0064: int = 123;
}
