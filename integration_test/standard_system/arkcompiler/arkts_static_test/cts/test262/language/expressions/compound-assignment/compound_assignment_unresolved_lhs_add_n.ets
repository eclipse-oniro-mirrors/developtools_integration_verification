/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0.
 */
/*---
tags: [compile-only, negative]
expected_out_1: ["Semantic error ESE0143: Unresolved reference unresolvedValue"]
---*/
function main(): void { let z: int = (unresolvedValue += 1); }
