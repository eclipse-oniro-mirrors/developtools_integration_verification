/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 */

// arktsid: const_global_block_scope
// description: Const declarations provide independent global and block scopes

function main(): void {
    const z: int = 4;
    {
        const z: int = 5;
        arktest.assertEQ(z, 5);
    }
    arktest.assertEQ(z, 4);
    if (true) {
        const z: int = 1;
        arktest.assertEQ(z, 1);
    }
}
