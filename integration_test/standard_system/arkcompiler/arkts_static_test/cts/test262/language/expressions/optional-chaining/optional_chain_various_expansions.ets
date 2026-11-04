/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

// arktsid: optional_chain_various_expansions
// description: various optional chain expansions (index, identifier, call, and chained forms)
// Conversion notes: covers the ?.[expr], ?.id, ?.(args), and chained OptionalChain productions on typed class instances
// and arrays.

class B {
    public val: int = 13;
}

class Obj {
    public a: string = 'hello';
    public b: B = new B();
    c(arg1: int): int { return arg1 * 2; }
    public arr: int[] = [11, 12];
}

function add(arg1: int, arg2: int): int {
    return arg1 + arg2;
}

function main(): void {
    let arr: int[] = [10, 11];
    let obj: Obj = new Obj();
    let i: int = 0;

    // OptionalChain: ?.[Expression]
    arktest.assertEQ(11, arr?.[i + 1]);

    // OptionalChain: ?.IdentifierName
    arktest.assertEQ('hello', obj?.a);

    // OptionalChain: ?.Arguments
    arktest.assertEQ(30, add?.(10, 20));

    // OptionalChain: OptionalChain [Expression]
    arktest.assertEQ(12, obj?.arr[i + 1]);

    // OptionalChain: OptionalChain .IdentifierName
    arktest.assertEQ(13, obj?.b.val);

    // OptionalChain: OptionalChain Arguments
    arktest.assertEQ(20, obj?.c(10));
}