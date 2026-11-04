/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * http://www.apache.org/licenses/LICENSE-2.0
 */


// arktsid: call_whitespace
// description: White Space and Line Terminator between MemberExpression and Arguments are allowed
// source: call/S11.2.3_A1.js (es5id 11.2.3_A1; rewritten without eval)
// (probe 2026-08-17: all JS whitespace/line-terminators accepted as token separators generally;
//  CR(0D) sub-test omitted -- CR=0 byte invariant)
// divergence: LF/LS/PS (line terminators) between callee and '(' trigger ASI in ArkTS
//             and are rejected; omitted per measured behavior (verify 2026-08-18).

function f(): number {
    return 0;
}

function main(): void {

    // TAB U+0009
    arktest.assertEQ(f	(), 0);

    // VT U+000B
    arktest.assertEQ(f(), 0);

    // FF U+000C
    arktest.assertEQ(f(), 0);

    // SP U+0020
    arktest.assertEQ(f (), 0);

    // NBSP U+00A0
    arktest.assertEQ(f (), 0);

    // combined 09 0B 0C 20 A0 (LF/LS/PS omitted per divergence; CR 0D omitted -- CR=0 byte invariant)
    arktest.assertEQ(f	  (), 0);
}
