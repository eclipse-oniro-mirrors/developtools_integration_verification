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
// arktsid: function_dflt_params_abrupt
// description: Abrupt completion returned by evaluation of initializer (function expression)

let callCount: int = 0;

function failing(): int {
    throw new Error('error');
}

function f(value: int = failing()): void {
    callCount += 1;
}

function main(): void {
    try {
        f();
        arktest.assertTrue(false);
    } catch (e) {
        arktest.assertEQ(callCount, 0);
    }
}
