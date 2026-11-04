/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 */

// arktsid: single_parameter_rest_block_return
// description: An arrow function may use only a rest parameter and return its length

function main(): void {
    let af = (...x: int[]): int => {
        return x.length;
    };
    arktest.assertEQ(af(1, 1, 1), 3);
}
