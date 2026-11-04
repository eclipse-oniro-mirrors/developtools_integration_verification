/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * http://www.apache.org/licenses/LICENSE-2.0
 */
/*---
desc: for-in declarations cannot mix initialized and uninitialized bindings
tags: [compile-only, negative]
expected_out_1: ["Syntax error ESY6987: 'for ... in' loop is not supported, please use regular 'for' or
    'for ... of ...' loop to iterate through arrays and iterable objects."]
---*/
let x: int = 3;
let y: int;
for (x in {}) { }
