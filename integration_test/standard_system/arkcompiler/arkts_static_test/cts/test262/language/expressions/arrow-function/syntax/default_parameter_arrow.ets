/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 */

// arktsid: default_parameter_arrow
// description: An arrow function parameter may have a default integer value

function main(): void {
    let af = (x: int = 1): int => x;
    arktest.assertEQ(af(), 1);
    arktest.assertEQ(af(2), 2);
}
