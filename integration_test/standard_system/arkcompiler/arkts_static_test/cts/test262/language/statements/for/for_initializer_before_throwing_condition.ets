/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 */

// arktsid: for_initializer_before_throwing_condition
// description: A for-loop initializer runs before its condition expression

let initializerEvaluated: boolean = false;

function initializeForCondition(): int {
    initializerEvaluated = true;
    return 0;
}

function throwFromCondition(): boolean {
    throw new Error('first expression');
}

function main(): void {
    let reached: boolean = false;
    arktest.expectThrow(() => {
        for (let x: int = initializeForCondition(); throwFromCondition();) {
            reached = true;
        }
    }, (e: Error) => e.name == 'Error');
    arktest.assertTrue(initializerEvaluated);
    arktest.assertFalse(reached);
}
