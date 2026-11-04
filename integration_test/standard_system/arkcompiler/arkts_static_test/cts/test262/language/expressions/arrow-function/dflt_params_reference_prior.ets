/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 */

// arktsid: dflt_params_reference_prior
// description: Default arrow parameters may reference an earlier parameter

function main(): void {
    let ref = (x: int, y: int = x, z: int = y): void => {
        arktest.assertEQ(x, 3);
        arktest.assertEQ(y, 3);
        arktest.assertEQ(z, 3);
    };
    ref(3);
}
