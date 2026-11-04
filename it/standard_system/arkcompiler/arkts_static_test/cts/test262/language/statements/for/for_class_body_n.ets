/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may obtain a copy of the License at
 * http://www.apache.org/licenses/LICENSE-2.0
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 */

/*---
desc: A class declaration is not allowed as a for body
tags: [compile-only, negative]
expected_out_1: ["Syntax error ESY0040: Illegal start of CLASS expression."]
---*/

function main(): void {
    for (; false;) {
        class C {
        }
    }
}
