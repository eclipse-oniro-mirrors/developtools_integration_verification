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

// arktsid: async_method_params_trailing_comma_multiple
// description: async trailing comma multiple
// source: async-method/params-trailing-comma-multiple.js
// Conversion notes: 源为 class 表达式（var C = class {...}），ArkTS 拒表达式（ESE0020），改 class 声明；assert.sameValue 改
// arktest.assertTrue；C.prototype.method() 改实例/类名直调。

class C {
    async method(a: number, b: number,): Promise<number> {
        arktest.assertEQ(a, 42, 'first parameter value');
        arktest.assertEQ(b, 39, 'second parameter value');
        return a + b;
    }
}

function main(): void {
    let c: C = new C();
    let p: Promise<number> = c.method(42, 39);
    arktest.assertTrue(p instanceof Promise);
}