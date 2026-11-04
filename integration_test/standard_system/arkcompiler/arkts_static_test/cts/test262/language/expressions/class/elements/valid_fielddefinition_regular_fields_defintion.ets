/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * http://www.apache.org/licenses/LICENSE-2.0
 */

// arktsid: regular-definitions-rs-field-identifier-initializer
// description: valid regular class field definitions with Unicode identifiers

class C {
    $: int = 1;
    _: int = 1;
    o: int = 1;
    ℘: int = 1;
    ZW_‌_NJ: int = 1;
    ZW_‍_J: int = 1;
}

function main(): void {
    let c = new C();
    arktest.assertEQ(c.$, 1);
    arktest.assertEQ(c._, 1);
    arktest.assertEQ(c.o, 1);
    arktest.assertEQ(c.℘, 1);
    arktest.assertEQ(c.ZW_‌_NJ, 1);
    arktest.assertEQ(c.ZW_‍_J, 1);
}
