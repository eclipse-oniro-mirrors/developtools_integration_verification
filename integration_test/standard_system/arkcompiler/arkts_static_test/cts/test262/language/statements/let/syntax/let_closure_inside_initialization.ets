/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 */

// arktsid: let_closure_inside_initialization
// description: A closure initialized with a for-loop let binding keeps the initial value

function main(): void {
    let callbacks: (() => int)[] = [];
    let initial: int = 0;
    let callback: () => int = (): int => initial;
    for (let i: int = 0; i < 5; i++) {
        callbacks.push(callback);
    }
    for (let k: int = 0; k < 5; k++) {
        arktest.assertEQ(callbacks[k](), 0);
    }
}
