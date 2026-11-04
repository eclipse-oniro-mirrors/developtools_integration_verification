/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * http://www.apache.org/licenses/LICENSE-2.0
 */

// arktsid: assignmenttargettype_ident_yield
// description: IdentifierReference yield is a valid assignment target (yield = 1)
// source: simple-basic-identifierreference-yield.js (AssignmentTargetType Return simple)
// (probe 2026-08-17: `let yield` accepted by es2panda, OK run; args/eval/await rejected)

function main(): void {
    let yield: number = 0;
    yield = 1;
    arktest.assertEQ(yield, 1);
}
