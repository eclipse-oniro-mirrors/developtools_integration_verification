/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * http://www.apache.org/licenses/LICENSE-2.0
 */

// arktsid: assignmenttargettype_member_identifiername
// description: MemberExpression . IdentifierName is a simple assignment target (o.v = 1)
// source: simple-complex-memberexpression.identifiername.js (AssignmentTargetType Return simple)
// (original used object literal + computed key; re-expressed with a class for ArkTS)

class C {
    public v: number = 0;
}

function main(): void {
    let o: C = new C();
    o.v = 1;
    arktest.assertEQ(o.v, 1);
}
