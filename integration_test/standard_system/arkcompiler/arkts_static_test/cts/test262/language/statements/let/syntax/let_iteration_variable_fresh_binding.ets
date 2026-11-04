/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 */

// arktsid: let_iteration_variable_fresh_binding
// description: A for-loop let binding is independently captured on each iteration

function main(): void {
    let callbacks: (() => int)[] = [];
    for (let i: int = 0; i < 5; i++) {
        let captured: int = i;
        callbacks.push((): int => captured);
    }
    for (let j: int = 0; j < 5; j++) {
        arktest.assertEQ(callbacks[j](), j);
    }
}
