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

// arktsid: addition_eval_order_throw
// description: First expression is evaluated first, then second (x() + y(), left operand throws)
// Conversion notes: JS throws strings; ArkTS throw requires Error, so a()/b() throw
// new Error. The assertion shifts to: a() throws before b() is reached (bCalled stays
// false) — the eval-order point is preserved. Same pattern as logical_and_eval_order_throw.ets.

function main(): void {
    let bCalled: boolean = false;
    let a = (): int => {
        throw new Error('x');
    };
    let b = (): int => {
        bCalled = true;
        return 2;
    };
    try {
        let r: int = a() + b();
    } catch (e) {
        arktest.assertFalse(bCalled);
        arktest.assertEQ((e as Error).message, 'x');
    }
}
