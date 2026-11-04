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

// arktsid: typeof_getvalue_getter
// description: typeof evaluates its operand via GetValue — a getter property is invoked exactly once
// Conversion notes: kept the getter-count semantics (typeof y === "number" and count === 1) from
// get-value.js. The plain data-property check (typeof x === "number") is dropped as trivially
// covered by typeof_number_literals.ets. JS Object.defineProperties on the global `this` maps to
// a small class with an accessor. VERIFIED on es2panda (2026-08-14): ArkTS `typeof` on a getter
// property evaluates the operand via GetValue — the getter runs exactly once (holder.count === 1)
// and the result is "number" for a double-returning accessor.

class GetterHolder {
    public count: int = 0;
    get y(): number {
        this.count++;
        return 1.0;
    }
}

function main(): void {
    let holder = new GetterHolder();
    // CHECK#2: typeof y === "number"
    arktest.assertEQ(typeof holder.y, 'number');
    // CHECK#3: the getter was invoked exactly once
    arktest.assertEQ(holder.count, 1);
}
