/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

// arktsid: block_scope_lexical_open
// description: A block creates a new lexical environment for its bindings

function main(): void {
    let x: string = 'outside';
    let probeBefore: () => string = (): string => x;
    let probeInside: () => string;

    {
        let x: string = 'inside';
        probeInside = (): string => x;
    }

    arktest.assertEQ(probeBefore(), 'outside');
    arktest.assertEQ(probeInside(), 'inside');
}
