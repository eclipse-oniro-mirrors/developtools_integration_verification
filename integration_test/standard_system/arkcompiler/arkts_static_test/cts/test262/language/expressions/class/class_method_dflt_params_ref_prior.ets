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

// arktsid: method_dflt_params_ref_prior
// description: default references earlier parameter
// source: method/dflt-params-ref-prior.js
// Conversion notes: 源为 class 表达式（var C = class {...}），ArkTS 拒表达式（ESE0020），改 class 声明；assert.sameValue 改
// arktest.assertTrue；C.prototype.method() 改实例/类名直调。

class C {
    method(x: number, y: number = x, z: number = y): void {
        arktest.assertTrue(x === 3);
        arktest.assertTrue(y === 3);
        arktest.assertTrue(z === 3);
    }
}

function main(): void {
    let c: C = new C();
    c.method(3);
}