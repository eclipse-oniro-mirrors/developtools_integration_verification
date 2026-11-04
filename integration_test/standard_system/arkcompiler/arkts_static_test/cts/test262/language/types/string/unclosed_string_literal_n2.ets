/* Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License"); */
/*---
desc: A single quote cannot start an unterminated string literal
tags: [compile-only, negative]
expected_out_1: [
    "Syntax error ESY0265: Newline is not allowed in strings",
    "Syntax error ESY0230: Expected '}', got 'end of stream'.",
]
---*/
function main(): void { let str: string = ';
