/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * http://www.apache.org/licenses/LICENSE-2.0
 */

// arktsid: trailing-comma
// description: call lexical and variable environment behavior

function foo(...values: int[]): void {
    arktest.assertEQ(values.length, 0);
}

function main(): void {
    foo(...[],);
}
