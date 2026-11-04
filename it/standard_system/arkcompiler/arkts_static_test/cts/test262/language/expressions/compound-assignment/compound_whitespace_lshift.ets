/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * http://www.apache.org/licenses/LICENSE-2.0
 */

// arktsid: compound_whitespace_lshift
// description: White Space and Line Terminator between LeftHandSideExpression and <<= /
//              between <<= and AssignmentExpression are allowed (S11.13.2_A1_T6)
// (verified 2026-08-17: TAB/VT/FF/SP/NBSP/LF/LS/PS all accepted by es2panda lexer;
//  CR(0D) sub-test omitted -- CR=0 byte invariant)

function main(): void {
    let x: number = 0;

    // TAB U+0009
    x = 1;
    arktest.assertEQ(x <<=	1, 2);
    arktest.assertEQ(x, 2);

    // VT U+000B
    x = 1;
    arktest.assertEQ(x <<=1, 2);
    arktest.assertEQ(x, 2);

    // FF U+000C
    x = 1;
    arktest.assertEQ(x <<=1, 2);
    arktest.assertEQ(x, 2);

    // SP U+0020
    x = 1;
    arktest.assertEQ(x <<= 1, 2);
    arktest.assertEQ(x, 2);

    // NBSP U+00A0
    x = 1;
    arktest.assertEQ(x <<= 1, 2);
    arktest.assertEQ(x, 2);

    // LF U+000A
    x = 1;
    arktest.assertEQ(x<<=
1, 2);
    arktest.assertEQ(x, 2);

    // LS U+2028
    x = 1;
    arktest.assertEQ(x <<= 1, 2);
    arktest.assertEQ(x, 2);

    // PS U+2029
    x = 1;
    arktest.assertEQ(x <<= 1, 2);
    arktest.assertEQ(x, 2);

    // combined 09 0B 0C 20 A0 0A 2028 2029 (CR 0D omitted)
    x = 1;
    arktest.assertEQ(x<<=
  1, 2);
    arktest.assertEQ(x, 2);
}
