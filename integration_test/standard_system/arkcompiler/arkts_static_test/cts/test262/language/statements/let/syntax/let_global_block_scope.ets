/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 */

// arktsid: let_global_block_scope
// description: Let declarations provide independent global and block scopes

function main(): void {
    let x: int;
    let y: int = 2;
    {
        let y: int;
        let x: int = 3;
        arktest.assertEQ(x, 3);
        arktest.assertEQ(y, 0);
    }
    arktest.assertEQ(x, 0);
    arktest.assertEQ(y, 2);
    if (true) {
        let y: int;
        arktest.assertEQ(y, 0);
    }
}
