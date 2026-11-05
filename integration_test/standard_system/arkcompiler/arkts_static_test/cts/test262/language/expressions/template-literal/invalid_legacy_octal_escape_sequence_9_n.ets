/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * http://www.apache.org/licenses/LICENSE-2.0
 */
/*---
desc: Invalid octal escape sequence in a template literal
tags: [compile-only, negative]
expected_out_1: |-
    Syntax error ESY0258: Invalid character escape sequence.
    Syntax error ESY0258: Invalid character escape sequence.
---*/
`\9`;
