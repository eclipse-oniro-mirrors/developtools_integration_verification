/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * http://www.apache.org/licenses/LICENSE-2.0
 */

// arktsid: S11.4.9_A2.1_T1
// description: Either Type(x) is not Reference or GetBase(x) is not null

class LogicalNotBooleanHolder {
    public prop: boolean = true;
}

function main(): void {
    arktest.assertEQ(!true, false);
    arktest.assertEQ(!(!true), true);

    let x: boolean = true;
    arktest.assertEQ(!x, false);
    arktest.assertEQ(!(!x), true);

    let holder = new LogicalNotBooleanHolder();
    arktest.assertEQ(!holder.prop, false);
}
