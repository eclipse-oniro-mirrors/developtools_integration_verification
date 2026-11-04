/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * http://www.apache.org/licenses/LICENSE-2.0
 */

/*---
desc: Numeric literal separator is disallowed inside a Unicode code point escape in a template literal (\u{1F_639})
tags: [compile-only, negative]
expected_out_1: ["Syntax error ESY0091: Invalid Unicode escape."]
---*/

`\u{1F_639}`;
