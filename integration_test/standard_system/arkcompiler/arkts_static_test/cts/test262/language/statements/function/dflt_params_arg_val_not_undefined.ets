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
// arktsid: dflt_params_arg_val_not_undefined
// description: Use of initializer when argument value is not `undefined` (function declaration)

let nanCount: number = 0;
let zeroCount: number = 0;
let callCount: number = 0;

function ref(aNaN: number = nanCount += 1, a0: number = zeroCount += 1): void {
    arktest.assertTrue(Number.isNaN(aNaN));
    arktest.assertEQ(a0, 0);
    callCount = callCount + 1;
}

function main(): void {
    ref(NaN, 0);
    arktest.assertEQ(callCount, 1);
    arktest.assertEQ(nanCount, 0);
    arktest.assertEQ(zeroCount, 0);
}
