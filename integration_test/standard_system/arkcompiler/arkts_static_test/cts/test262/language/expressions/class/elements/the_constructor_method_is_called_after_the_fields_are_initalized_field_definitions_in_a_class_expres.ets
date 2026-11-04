/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * http://www.apache.org/licenses/LICENSE-2.0
 */

// arktsid: ctor-called-after-fields-init
// description: class element initialization semantics

let ctor: int = 0;

class C {
    public foo: int = 42;
    constructor() {
        ctor = this.foo;
    }
}

function main(): void {
    let instance = new C();
    arktest.assertEQ(ctor, 42);
    arktest.assertEQ(instance.foo, 42);
}
