/* Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License"); */
/*---
desc: The reserved word public cannot be used as an identifier in strict code
tags: [compile-only, negative]
expected_out_1: |-
    Syntax error ESY0316: Hard keyword 'public' cannot be used as identifier
    Syntax error ESY0224: Identifier expected, got 'public'.
---*/
function main(): void { let public: int = 1; }
