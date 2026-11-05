/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * http://www.apache.org/licenses/LICENSE-2.0
 */

// arktsid: fields-asi-2
// description: class elements compatibility review

class C {
    public x: string = 'lol'
    [1]
}

function main(): void {
    let c = new C();
    arktest.assertEQ(c.x, 'o');
}
