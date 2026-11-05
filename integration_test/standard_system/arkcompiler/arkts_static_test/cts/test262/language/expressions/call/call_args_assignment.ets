/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * http://www.apache.org/licenses/LICENSE-2.0
 */

// arktsid: call_args_assignment
// description: Arguments are evaluated left-to-right; assignments in the
//              argument list take effect for later arguments (S11.2.4_A1.4_T3)
// source: call/S11.2.4_A1.4_T3.js (`fArg(x=1,y=x,x+y) === 2`)

function fArg(x: number, y: number, z: number): number {
    return z;
}

function main(): void {
    let x: number = 0;
    let y: number = 0;
    let result: number = fArg(x = 1, y = x, x + y);
    arktest.assertEQ(result, 2);
    arktest.assertEQ(x, 1);
    arktest.assertEQ(y, 1);
}
