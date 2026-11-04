/* Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License"); */
/*---
desc: Multiple single quotes do not form a valid string literal
tags: [compile-only, negative]
expected_out_1: ["Syntax error ESY0227: Unexpected token ''."]
---*/
function main(): void { let str: string = ''''; }
