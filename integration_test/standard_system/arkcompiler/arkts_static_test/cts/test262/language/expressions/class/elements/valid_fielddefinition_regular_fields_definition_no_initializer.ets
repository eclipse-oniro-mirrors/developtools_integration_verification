/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * http://www.apache.org/licenses/LICENSE-2.0
 */

// arktsid: regular-definitions-rs-field-identifier
// description: valid regular class field definitions with Unicode identifiers

class C {
    $: int;
    public _: int;
    public o: int;
    ℘: int;
    ZW_‌_NJ: int;
    ZW_‍_J: int;
}

function main(): void {
    let c = new C();
    c.$ = 1;
    c._ = 1;
    c.o = 1;
    c.℘ = 1;
    c.ZW_‌_NJ = 1;
    c.ZW_‍_J = 1;
    arktest.assertEQ(c.$, 1);
    arktest.assertEQ(c._, 1);
    arktest.assertEQ(c.o, 1);
    arktest.assertEQ(c.℘, 1);
    arktest.assertEQ(c.ZW_‌_NJ, 1);
    arktest.assertEQ(c.ZW_‍_J, 1);
}