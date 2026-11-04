/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 */

/*---
desc: A parenthesized return expression is not allowed outside a function
tags: [compile-only, negative]
expected_out_1: ["Syntax error ESY0163: return keyword should be used in function body."]
---*/

return (0);
