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

// arktsid: optional_chain_short_circuiting
// description: optional chaining short-circuits, the RHS is not evaluated when the base is null/undefined
// Conversion notes: a counter is bumped only inside the chain's final call; when the base is nullish the whole chain is
// skipped so the counter stays at 0, demonstrating short-circuiting.

let called: number = 0;

class Inner {
    c(): number { called++; return 0; }
}

class Outer {
    public b: Inner = new Inner();
    public d: number = 9;
}

function main(): void {
    let a: Outer | undefined = undefined;

    a?.[0];          // short-circuiting.
    a?.b.c();        // long short-circuiting.

    let u: Outer | undefined = undefined;
    u?.[1];          // short-circuiting.
    u?.b.c();        // long short-circuiting.

    arktest.assertEQ(0, called);
}