/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * http://www.apache.org/licenses/LICENSE-2.0
 */

// arktsid: S9.2_A5_T2
// description: Empty String converts to Boolean by implicit transformation

function main(): void {
    arktest.assertEQ(!'', true);
}
