/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 */

// arktsid: const_outer_inner_bindings
// description: Inner for-loop const bindings do not change outer bindings

function main(): void {
    const x: string = 'outer_x';
    const y: string = 'outer_y';
    for (let i: int = 0; i < 1; i++) {
        const innerX: string = 'inner_x';
        const innerY: string = 'inner_y';
        arktest.assertEQ(innerX, 'inner_x');
        arktest.assertEQ(innerY, 'inner_y');
    }
    arktest.assertEQ(x, 'outer_x');
    arktest.assertEQ(y, 'outer_y');
}
