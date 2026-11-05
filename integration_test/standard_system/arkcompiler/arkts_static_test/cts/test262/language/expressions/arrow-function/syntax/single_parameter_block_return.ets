/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 */

// arktsid: single_parameter_block_return
// description: An arrow function with a single parameter can use a block body

function main(): void {
    let af = (bindingIdentifier: int): int => {
        return bindingIdentifier;
    };
    arktest.assertEQ(af(1), 1);
}
