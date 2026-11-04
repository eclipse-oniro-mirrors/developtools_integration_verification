/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * http://www.apache.org/licenses/LICENSE-2.0
 */

// arktsid: scope-var-close
// description: call lexical and variable environment behavior

function makeProbe(): (() => string) {
    let inside: string = 'inside';
    return (): string => inside;
}

function main(): void {
    let probe = makeProbe();
    let outside: string = 'outside';
    arktest.assertEQ(probe(), 'inside');
    arktest.assertEQ(outside, 'outside');
}
