/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 */

// arktsid: let_multi_binding_fresh_closures
// description: Multiple let bindings in a loop are independently captured on each iteration

function main(): void {
    let first: (() => int)[] = [];
    let second: (() => int)[] = [];
    for (let i: int = 0; i < 5; i++) {
        let j: int = i + 10;
        let capturedI: int = i;
        let capturedJ: int = j;
        first.push((): int => capturedI);
        second.push((): int => capturedJ);
    }
    for (let k: int = 0; k < 5; k++) {
        arktest.assertEQ(first[k](), k);
        arktest.assertEQ(second[k](), k + 10);
    }
}
