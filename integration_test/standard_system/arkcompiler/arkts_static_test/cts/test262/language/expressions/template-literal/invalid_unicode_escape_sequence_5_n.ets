/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * http://www.apache.org/licenses/LICENSE-2.0
 */
/*---
desc: Invalid Unicode escape sequence in a template literal
tags: [compile-only, negative]
expected_out_1: |-
    Syntax error ESY0248: Hexadecimal digit expected.
    Syntax error ESY0091: Invalid Unicode escape.
    Syntax error ESY0228: Unexpected token, expected '`'.
    Syntax error ESY0248: Hexadecimal digit expected.
    Syntax error ESY0091: Invalid Unicode escape.
    Syntax error ESY0253: Unterminated string.
---*/
`\u{g`;
