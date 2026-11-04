/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 */

/*---
desc: A return in a top-level catch block is not allowed
tags: [compile-only, negative]
expected_out_1: ["Syntax error ESY0163: return keyword should be used in function body."]
---*/

try {
    throw new Error('x');
} catch (e) {
    return e;
}
