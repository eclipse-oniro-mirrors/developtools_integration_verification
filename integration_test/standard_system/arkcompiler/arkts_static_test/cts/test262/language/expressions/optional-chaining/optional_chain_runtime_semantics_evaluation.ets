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

// arktsid: optional_chain_runtime_semantics_evaluation
// description: accessing an optional value on null or undefined returns undefined
// Conversion notes: covers base being null or undefined; the result of ?. on a non-nullish base with missing member is
// undefined.

class A {
    public a: number = 5;
}

function main(): void {
    let nul: A | null = null;
    let undf: A | undefined = undefined;
    let r1: number | undefined = nul?.a;
    let r2: number | undefined = undf?.a;
    arktest.assertEQ(undefined, r1);
    arktest.assertEQ(undefined, r2);
}