/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 */

// arktsid: for_initializer_before_empty_clauses
// description: The for initializer runs before empty condition and update clauses

function throwFromInitializerA22(): int {
    throw new Error('no-in expression');
}

function main(): void {
    let reached: boolean = false;
    arktest.expectThrow(() => {
        for (let x: int = throwFromInitializerA22(); ;) {
            reached = true;
            break;
        }
    }, (e: Error) => e.name == 'Error');
    arktest.assertFalse(reached);
}
