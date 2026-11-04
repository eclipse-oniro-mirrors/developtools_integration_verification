/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

// arktsid: block_scope_lexical_close
// description: A block lexical binding remains captured after the block closes

function main(): void {
    let probe: () => string;
    {
        let x: string = 'inside';
        probe = (): string => x;
    }

    let x: string = 'outside';
    arktest.assertEQ(x, 'outside');
    arktest.assertEQ(probe(), 'inside');
}
