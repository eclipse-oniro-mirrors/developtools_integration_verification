/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * http://www.apache.org/licenses/LICENSE-2.0
 */

// arktsid: S9.2_A3_T2
// description: true and false convert to Boolean by implicit transformation

function main(): void {
    arktest.assertEQ(!true, false);
    arktest.assertEQ(!false, true);
}
