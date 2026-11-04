/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * http://www.apache.org/licenses/LICENSE-2.0
 */


// arktsid: new_whitespace_member
// description: White Space and Line Terminator between "new" and MemberExpression are allowed
// source: new/S11.2.2_A1.2.js (es5id 11.2.2_A1.2; rewritten without eval, class instead of Number)
// (verified 2026-08-17: TAB/VT/FF/SP/NBSP/LF/LS/PS all accepted as token separators;
//  CR(0D) sub-test omitted -- CR=0 byte invariant)

class C {
    public v: number = 7;
}

function main(): void {

    // TAB U+0009
    arktest.assertEQ(new	C().v, 7);

    // VT U+000B
    arktest.assertEQ(newC().v, 7);

    // FF U+000C
    arktest.assertEQ(newC().v, 7);

    // SP U+0020
    arktest.assertEQ(new C().v, 7);

    // NBSP U+00A0
    arktest.assertEQ(new C().v, 7);

    // LF U+000A
    arktest.assertEQ(new
C().v, 7);

    // LS U+2028
    arktest.assertEQ(new C().v, 7);

    // PS U+2029
    arktest.assertEQ(new C().v, 7);

    // combined 09 0B 0C 20 A0 0A 2028 2029 (CR 0D omitted)
    arktest.assertEQ(new	  
  C().v, 7);
}
