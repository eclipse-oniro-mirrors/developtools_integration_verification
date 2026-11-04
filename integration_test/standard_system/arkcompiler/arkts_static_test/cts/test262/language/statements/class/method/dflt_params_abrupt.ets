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

// arktsid: dflt_params_abrupt
// description: default parameter evaluates to a throw; body not evaluated
// source: method/dflt-params-abrupt.js

function boom(): number {
    throw new Error('boom');
}

class C {
    method(_: number = boom()): void {
    }
}

function main(): void {
    let c: C = new C();
    let threw = false;
    try {
        c.method();
    } catch (e) {
        threw = true;
    }
    arktest.assertTrue(threw);
}
