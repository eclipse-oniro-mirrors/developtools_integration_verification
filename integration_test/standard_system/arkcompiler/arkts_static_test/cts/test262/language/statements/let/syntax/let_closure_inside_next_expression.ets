/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 */

// arktsid: let_closure_inside_next_expression
// description: A closure created in the for-loop update sequence observes the current let binding

function main(): void {
    let callbacks: (() => int)[] = [];
    for (let i: int = 0; i < 5; i++) {
        let captured: int = i;
        callbacks.push((): int => captured);
    }
    for (let k: int = 0; k < 5; k++) {
        arktest.assertEQ(callbacks[k](), k);
    }
}
