/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 */

// arktsid: dflt_params_abrupt
// description: An exception in an arrow default parameter prevents body evaluation

function failDefault(): int {
    throw new Error('default parameter');
}

function main(): void {
    let callCount: int = 0;
    let f = (x: int = failDefault()): void => {
        callCount++;
    };
    arktest.expectThrow(() => {
        f();
    }, (e: Error) => e.name == 'Error');
    arktest.assertEQ(callCount, 0);
}
